<?php

/*
 * Copyright (C) 2019 Samuel da Silva Mendes <mendessamuel84@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Core\Lib\FS;

/**
 *  Classe responsavel pelo Socket Server externo da Aplicação.
 *
 * @author Samuel da Silva Mendes <mendessamuel84@gmail.com>
 * 
 */
class Server {

    /**
     * Set ip listen sever
     * @var type 
     */
    private static $address = NULL;

    /**
     * Set port listen sever
     * @var string 
     */
    private static $port = NULL;

    /**
     * Connect server;
     * @var type object
     */
    private static $sock = NULL;

    /**
     * Socket client
     * @var type object
     */
    private static $cliente = NULL;
    private static $App = NULL;
    private static $Dados = NULL;

    function __construct() {
        set_time_limit(0);
        if (!empty(SRV_LISTEN) && !empty(SRV_PORT)) {
            self::$address = SRV_LISTEN;
            self::$port = SRV_PORT;
        } else {
            self::$address = '127.0.0.1';
            self::$port = 8064;
        }
    }

    private static function Server_Socket() {
        self::$sock = socket_create(AF_INET, SOCK_STREAM, 0);
        if (self::$sock < 0) {
            SetSyslog("Nao foi possivel obter socket para conexao com self::$sock", "ERR");
            //echo "Nao foi possivel obter socket para conexao com self::$sock\n";
            exit;
        }
        /* De um bind na porta */
        $bind = socket_bind(self::$sock, self::$address, self::$port);
        if ($bind < 0) {
            SetSyslog("socket_bind() failed: reason: " . \socket_strerror(socket_last_error(self::$sock)), "ERR");
            //echo "socket_bind() failed: reason: " . \socket_strerror(socket_last_error(self::$sock)) . "\n";
            exit;
        }
        $listen = socket_listen(self::$sock, 5);
        if ($listen < 0) {
            SetSyslog("socket_listen() failed: reason: " . \socket_strerror(socket_last_error(self::$sock)), "ERR");
            //echo "socket_listen() failed: reason: " . \socket_strerror(socket_last_error(self::$sock)) . "\n";
            exit;
        }
        SetSyslog("PHP Socket Server: " . self::$address . ":" . self::$port);
        //echo "PHP Socket Server: " . self::$address . ":" . self::$port . "\n";
        $conexao = 0;
        while (true) {
            self::$cliente = socket_accept(self::$sock);
            if (self::$cliente < 0) {
                SetSyslog("socket_accept failed: reason: " . \socket_strerror(socket_last_error(self::$sock)), "ERR");
                //echo "socket_accept failed: reason: " . \socket_strerror(socket_last_error(self::$sock)) . "\n";
                break;
            }
            $conexao++;
            SetSyslog("Conexao: $conexao");
            //echo "Conexao: $conexao\n";
            self::SendConnect();
            $x = 0;
            while ($funcao = \socket_read(self::$cliente, 1024, \PHP_NORMAL_READ)) {
                $x++;
                usleep(100);
                $a = explode(':', $funcao);
                $b[$a[0]] = ltrim($a[1]);

                if ($x > 10000) {
                    break;
                }
                if ($funcao === \PHP_EOL) {
                    break;
                }
            }

            if (isset($b["variable_App"])) {
                $var_app = urldecode($b["variable_App"]);
                $string = trim(preg_replace('/\s+/', ' ', $var_app));
                $app = '\App' . $string . '\App' . $string;
                self::$App = $app;
            }
            if (isset($b["variable_DADOS"])) {
                $data = urldecode($b["variable_DADOS"]);
                self::$Dados = $data;
            }

            if (self::$App) {
                $rum_app = new self::$App(self::$cliente);
                $array_1 = explode('&', self::$Dados);

                foreach ($array_1 as $key => $value) {
                    $val = explode('=', $value);
                    $var_dados[$val[0]] = $val[1];
                }
                $rum_app->setData($var_dados);
                $rum_app->ActionRun();
            }
        }
    }

    private static function SendConnect() {
        $msgler = "connect\n\n";
        $msgler .= "myevents\n\n";
        return \socket_write(self::$cliente, $msgler, strlen($msgler));
    }

    public function socket() {
        return self::Server_Socket();
    }

    public function closed() {
        $linger = ['l_linger' => 0, 'l_onoff' => 1];
        \socket_set_option(self::$sock, SOL_SOCKET, SO_LINGER, $linger);
        \socket_close(self::$sock);
    }

}
