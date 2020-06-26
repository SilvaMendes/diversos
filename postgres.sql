--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: acc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.acc (
    id integer NOT NULL,
    method character varying(16) DEFAULT ''::character varying NOT NULL,
    from_tag character varying(64) DEFAULT ''::character varying NOT NULL,
    to_tag character varying(64) DEFAULT ''::character varying NOT NULL,
    callid character varying(64) DEFAULT ''::character varying NOT NULL,
    sip_code character varying(3) DEFAULT ''::character varying NOT NULL,
    sip_reason character varying(32) DEFAULT ''::character varying NOT NULL,
    "time" timestamp without time zone NOT NULL,
    duration integer DEFAULT 0 NOT NULL,
    ms_duration integer DEFAULT 0 NOT NULL,
    setuptime integer DEFAULT 0 NOT NULL,
    created character varying DEFAULT to_char(now(), 'HH24:MI:SS'::text),
    ani character varying,
    rdnis_outbound character varying,
    rdnis_inbound character varying,
    gw_outbound character varying,
    "end" character varying DEFAULT to_char(now(), 'YYYY-MM-DD HH24:MI:SS'::text)
);


ALTER TABLE public.acc OWNER TO postgres;

--
-- Name: acc_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.acc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.acc_id_seq OWNER TO postgres;

--
-- Name: acc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.acc_id_seq OWNED BY public.acc.id;


--
-- Name: active_watchers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.active_watchers (
    id integer NOT NULL,
    presentity_uri character varying(128) NOT NULL,
    watcher_username character varying(64) NOT NULL,
    watcher_domain character varying(64) NOT NULL,
    to_user character varying(64) NOT NULL,
    to_domain character varying(64) NOT NULL,
    event character varying(64) DEFAULT 'presence'::character varying NOT NULL,
    event_id character varying(64),
    to_tag character varying(64) NOT NULL,
    from_tag character varying(64) NOT NULL,
    callid character varying(64) NOT NULL,
    local_cseq integer NOT NULL,
    remote_cseq integer NOT NULL,
    contact character varying(128) NOT NULL,
    record_route text,
    expires integer NOT NULL,
    status integer DEFAULT 2 NOT NULL,
    reason character varying(64),
    version integer DEFAULT 0 NOT NULL,
    socket_info character varying(64) NOT NULL,
    local_contact character varying(128) NOT NULL,
    sharing_tag character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE public.active_watchers OWNER TO postgres;

--
-- Name: active_watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.active_watchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.active_watchers_id_seq OWNER TO postgres;

--
-- Name: active_watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.active_watchers_id_seq OWNED BY public.active_watchers.id;


--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.address (
    id integer NOT NULL,
    grp smallint DEFAULT 0 NOT NULL,
    ip character varying(50) NOT NULL,
    mask smallint DEFAULT 32 NOT NULL,
    port smallint DEFAULT 0 NOT NULL,
    proto character varying(4) DEFAULT 'any'::character varying NOT NULL,
    pattern character varying(64) DEFAULT NULL::character varying,
    context_info character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE public.address OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;


--
-- Name: b2b_entities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.b2b_entities (
    id integer NOT NULL,
    type integer NOT NULL,
    state integer NOT NULL,
    ruri character varying(128),
    from_uri character varying(128) NOT NULL,
    to_uri character varying(128) NOT NULL,
    from_dname character varying(64),
    to_dname character varying(64),
    tag0 character varying(64) NOT NULL,
    tag1 character varying(64),
    callid character varying(64) NOT NULL,
    cseq0 integer NOT NULL,
    cseq1 integer,
    contact0 character varying(128) NOT NULL,
    contact1 character varying(128),
    route0 text,
    route1 text,
    sockinfo_srv character varying(64),
    param character varying(128) NOT NULL,
    lm integer NOT NULL,
    lrc integer,
    lic integer,
    leg_cseq integer,
    leg_route text,
    leg_tag character varying(64),
    leg_contact character varying(128),
    leg_sockinfo character varying(128)
);


ALTER TABLE public.b2b_entities OWNER TO postgres;

--
-- Name: b2b_entities_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.b2b_entities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.b2b_entities_id_seq OWNER TO postgres;

--
-- Name: b2b_entities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.b2b_entities_id_seq OWNED BY public.b2b_entities.id;


--
-- Name: b2b_logic; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.b2b_logic (
    id integer NOT NULL,
    si_key character varying(64) NOT NULL,
    scenario character varying(64),
    sstate integer NOT NULL,
    next_sstate integer NOT NULL,
    sparam0 character varying(64),
    sparam1 character varying(64),
    sparam2 character varying(64),
    sparam3 character varying(64),
    sparam4 character varying(64),
    sdp text,
    lifetime integer DEFAULT 0 NOT NULL,
    e1_type integer NOT NULL,
    e1_sid character varying(64),
    e1_from character varying(128) NOT NULL,
    e1_to character varying(128) NOT NULL,
    e1_key character varying(64) NOT NULL,
    e2_type integer NOT NULL,
    e2_sid character varying(64),
    e2_from character varying(128) NOT NULL,
    e2_to character varying(128) NOT NULL,
    e2_key character varying(64) NOT NULL,
    e3_type integer,
    e3_sid character varying(64),
    e3_from character varying(128),
    e3_to character varying(128),
    e3_key character varying(64)
);


ALTER TABLE public.b2b_logic OWNER TO postgres;

--
-- Name: b2b_logic_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.b2b_logic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.b2b_logic_id_seq OWNER TO postgres;

--
-- Name: b2b_logic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.b2b_logic_id_seq OWNED BY public.b2b_logic.id;


--
-- Name: b2b_sca; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.b2b_sca (
    id integer NOT NULL,
    shared_line character varying(64) NOT NULL,
    watchers character varying(255) NOT NULL,
    app1_shared_entity integer,
    app1_call_state integer,
    app1_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app1_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app1_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app2_shared_entity integer,
    app2_call_state integer,
    app2_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app2_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app2_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app3_shared_entity integer,
    app3_call_state integer,
    app3_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app3_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app3_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app4_shared_entity integer,
    app4_call_state integer,
    app4_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app4_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app4_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app5_shared_entity integer,
    app5_call_state integer,
    app5_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app5_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app5_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app6_shared_entity integer,
    app6_call_state integer,
    app6_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app6_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app6_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app7_shared_entity integer,
    app7_call_state integer,
    app7_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app7_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app7_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app8_shared_entity integer,
    app8_call_state integer,
    app8_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app8_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app8_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app9_shared_entity integer,
    app9_call_state integer,
    app9_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app9_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app9_b2bl_key character varying(64) DEFAULT NULL::character varying,
    app10_shared_entity integer,
    app10_call_state integer,
    app10_call_info_uri character varying(128) DEFAULT NULL::character varying,
    app10_call_info_appearance_uri character varying(128) DEFAULT NULL::character varying,
    app10_b2bl_key character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.b2b_sca OWNER TO postgres;

--
-- Name: b2b_sca_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.b2b_sca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.b2b_sca_id_seq OWNER TO postgres;

--
-- Name: b2b_sca_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.b2b_sca_id_seq OWNED BY public.b2b_sca.id;


--
-- Name: cachedb; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.cachedb (
    keyname character varying(255) NOT NULL,
    value text NOT NULL,
    counter integer DEFAULT 0 NOT NULL,
    expires integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cachedb OWNER TO postgres;

--
-- Name: call_mos; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE public.call_mos (
    id bigint NOT NULL,
    callid character varying(64),
    mos_min_t double precision,
    mos_max_t double precision,
    mos_media double precision
);


ALTER TABLE public.call_mos OWNER TO admin;

--
-- Name: call_mos_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.call_mos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.call_mos_id_seq OWNER TO admin;

--
-- Name: call_mos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.call_mos_id_seq OWNED BY public.call_mos.id;


--
-- Name: carrierfailureroute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.carrierfailureroute (
    id integer NOT NULL,
    carrier integer DEFAULT 0 NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    scan_prefix character varying(64) DEFAULT ''::character varying NOT NULL,
    host_name character varying(128) DEFAULT ''::character varying NOT NULL,
    reply_code character varying(3) DEFAULT ''::character varying NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    mask integer DEFAULT 0 NOT NULL,
    next_domain character varying(64) DEFAULT ''::character varying NOT NULL,
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.carrierfailureroute OWNER TO postgres;

--
-- Name: carrierfailureroute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrierfailureroute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.carrierfailureroute_id_seq OWNER TO postgres;

--
-- Name: carrierfailureroute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrierfailureroute_id_seq OWNED BY public.carrierfailureroute.id;


--
-- Name: carrierroute; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.carrierroute (
    id integer NOT NULL,
    carrier integer DEFAULT 0 NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    scan_prefix character varying(64) DEFAULT ''::character varying NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    mask integer DEFAULT 0 NOT NULL,
    prob real DEFAULT 0 NOT NULL,
    strip integer DEFAULT 0 NOT NULL,
    rewrite_host character varying(128) DEFAULT ''::character varying NOT NULL,
    rewrite_prefix character varying(64) DEFAULT ''::character varying NOT NULL,
    rewrite_suffix character varying(64) DEFAULT ''::character varying NOT NULL,
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.carrierroute OWNER TO postgres;

--
-- Name: carrierroute_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carrierroute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.carrierroute_id_seq OWNER TO postgres;

--
-- Name: carrierroute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carrierroute_id_seq OWNED BY public.carrierroute.id;


--
-- Name: cc_agents; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.cc_agents (
    id integer NOT NULL,
    agentid character varying(128) NOT NULL,
    location character varying(128) NOT NULL,
    logstate integer DEFAULT 0 NOT NULL,
    skills character varying(255) NOT NULL,
    last_call_end integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.cc_agents OWNER TO postgres;

--
-- Name: cc_agents_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cc_agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.cc_agents_id_seq OWNER TO postgres;

--
-- Name: cc_agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cc_agents_id_seq OWNED BY public.cc_agents.id;


--
-- Name: cc_calls; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.cc_calls (
    id integer NOT NULL,
    state integer NOT NULL,
    ig_cback integer NOT NULL,
    no_rej integer NOT NULL,
    setup_time integer NOT NULL,
    eta integer NOT NULL,
    last_start integer NOT NULL,
    recv_time integer NOT NULL,
    caller_dn character varying(128) NOT NULL,
    caller_un character varying(128) NOT NULL,
    b2buaid character varying(128) DEFAULT ''::character varying NOT NULL,
    flow character varying(128) NOT NULL,
    agent character varying(128) NOT NULL
);


ALTER TABLE public.cc_calls OWNER TO postgres;

--
-- Name: cc_calls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cc_calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.cc_calls_id_seq OWNER TO postgres;

--
-- Name: cc_calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cc_calls_id_seq OWNED BY public.cc_calls.id;


--
-- Name: cc_cdrs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.cc_cdrs (
    id integer NOT NULL,
    caller character varying(64) NOT NULL,
    received_timestamp timestamp without time zone NOT NULL,
    wait_time integer DEFAULT 0 NOT NULL,
    pickup_time integer DEFAULT 0 NOT NULL,
    talk_time integer DEFAULT 0 NOT NULL,
    flow_id character varying(128) NOT NULL,
    agent_id character varying(128) DEFAULT NULL::character varying,
    call_type integer DEFAULT (-1) NOT NULL,
    rejected integer DEFAULT 0 NOT NULL,
    fstats integer DEFAULT 0 NOT NULL,
    cid integer DEFAULT 0
);


ALTER TABLE public.cc_cdrs OWNER TO postgres;

--
-- Name: cc_cdrs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cc_cdrs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.cc_cdrs_id_seq OWNER TO postgres;

--
-- Name: cc_cdrs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cc_cdrs_id_seq OWNED BY public.cc_cdrs.id;


--
-- Name: cc_flows; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.cc_flows (
    id integer NOT NULL,
    flowid character varying(64) NOT NULL,
    priority integer DEFAULT 256 NOT NULL,
    skill character varying(64) NOT NULL,
    prependcid character varying(32) NOT NULL,
    message_welcome character varying(128) DEFAULT NULL::character varying,
    message_queue character varying(128) NOT NULL
);


ALTER TABLE public.cc_flows OWNER TO postgres;

--
-- Name: cc_flows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cc_flows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.cc_flows_id_seq OWNER TO postgres;

--
-- Name: cc_flows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cc_flows_id_seq OWNED BY public.cc_flows.id;


--
-- Name: closeddial; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.closeddial (
    id integer NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    cd_username character varying(64) DEFAULT ''::character varying NOT NULL,
    cd_domain character varying(64) DEFAULT ''::character varying NOT NULL,
    group_id character varying(64) DEFAULT ''::character varying NOT NULL,
    new_uri character varying(128) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.closeddial OWNER TO postgres;

--
-- Name: closeddial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.closeddial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.closeddial_id_seq OWNER TO postgres;

--
-- Name: closeddial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.closeddial_id_seq OWNED BY public.closeddial.id;


--
-- Name: clusterer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.clusterer (
    id integer NOT NULL,
    cluster_id integer NOT NULL,
    node_id integer NOT NULL,
    url character varying(64) NOT NULL,
    state integer DEFAULT 1 NOT NULL,
    no_ping_retries integer DEFAULT 3 NOT NULL,
    priority integer DEFAULT 50 NOT NULL,
    sip_addr character varying(64),
    flags character varying(64),
    description character varying(64)
);


ALTER TABLE public.clusterer OWNER TO postgres;

--
-- Name: clusterer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clusterer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.clusterer_id_seq OWNER TO postgres;

--
-- Name: clusterer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clusterer_id_seq OWNED BY public.clusterer.id;


--
-- Name: codec; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE public.codec (
    codec text NOT NULL
);


ALTER TABLE public.codec OWNER TO admin;

--
-- Name: cpl; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.cpl (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    cpl_xml text,
    cpl_bin text
);


ALTER TABLE public.cpl OWNER TO postgres;

--
-- Name: cpl_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cpl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.cpl_id_seq OWNER TO postgres;

--
-- Name: cpl_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cpl_id_seq OWNED BY public.cpl.id;


--
-- Name: dbaliases; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dbaliases (
    id integer NOT NULL,
    alias_username character varying(64) DEFAULT ''::character varying NOT NULL,
    alias_domain character varying(64) DEFAULT ''::character varying NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.dbaliases OWNER TO postgres;

--
-- Name: dbaliases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dbaliases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dbaliases_id_seq OWNER TO postgres;

--
-- Name: dbaliases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dbaliases_id_seq OWNED BY public.dbaliases.id;


--
-- Name: dialog; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dialog (
    dlg_id bigint NOT NULL,
    callid character varying(255) NOT NULL,
    from_uri character varying(128) NOT NULL,
    from_tag character varying(64) NOT NULL,
    to_uri character varying(128) NOT NULL,
    to_tag character varying(64) NOT NULL,
    mangled_from_uri character varying(64) DEFAULT NULL::character varying,
    mangled_to_uri character varying(64) DEFAULT NULL::character varying,
    caller_cseq character varying(11) NOT NULL,
    callee_cseq character varying(11) NOT NULL,
    caller_ping_cseq integer NOT NULL,
    callee_ping_cseq integer NOT NULL,
    caller_route_set text,
    callee_route_set text,
    caller_contact character varying(128),
    callee_contact character varying(128),
    caller_sock character varying(64) NOT NULL,
    callee_sock character varying(64) NOT NULL,
    state integer NOT NULL,
    start_time integer NOT NULL,
    timeout integer NOT NULL,
    vars bytea,
    profiles text,
    script_flags integer DEFAULT 0 NOT NULL,
    module_flags integer DEFAULT 0 NOT NULL,
    flags integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.dialog OWNER TO postgres;

--
-- Name: dialplan; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE public.dialplan (
    id integer NOT NULL,
    dpid integer NOT NULL,
    pr integer DEFAULT 0 NOT NULL,
    match_op integer NOT NULL,
    match_exp character varying(64) NOT NULL,
    match_flags integer NOT NULL,
    subst_exp character varying(64),
    repl_exp character varying(32),
    timerec character varying(255),
    disabled integer DEFAULT 0 NOT NULL,
    attrs character varying(255)
);


ALTER TABLE public.dialplan OWNER TO admin;

--
-- Name: dialplan_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dialplan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dialplan_id_seq OWNER TO admin;

--
-- Name: dialplan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dialplan_id_seq OWNED BY public.dialplan.id;


--
-- Name: dialplan_local; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE public.dialplan_local (
    id integer NOT NULL,
    dpid integer NOT NULL,
    pr integer DEFAULT 0 NOT NULL,
    match_op integer NOT NULL,
    match_exp character varying(64) NOT NULL,
    match_flags integer DEFAULT 0 NOT NULL,
    subst_exp character varying(64) DEFAULT NULL::character varying,
    repl_exp character varying(32) DEFAULT NULL::character varying,
    timerec character varying(255) DEFAULT NULL::character varying,
    disabled integer DEFAULT 0 NOT NULL,
    attrs character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.dialplan_local OWNER TO admin;

--
-- Name: dialplan_local_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dialplan_local_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dialplan_local_id_seq OWNER TO admin;

--
-- Name: dialplan_local_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dialplan_local_id_seq OWNED BY public.dialplan_local.id;


--
-- Name: dispatcher; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dispatcher (
    id integer NOT NULL,
    setid integer DEFAULT 0 NOT NULL,
    destination character varying(192) DEFAULT ''::character varying NOT NULL,
    socket character varying(128) DEFAULT NULL::character varying,
    state integer DEFAULT 0 NOT NULL,
    weight character varying(64) DEFAULT 1 NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attrs character varying(128) DEFAULT ''::character varying NOT NULL,
    description character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.dispatcher OWNER TO postgres;

--
-- Name: dispatcher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dispatcher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dispatcher_id_seq OWNER TO postgres;

--
-- Name: dispatcher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dispatcher_id_seq OWNED BY public.dispatcher.id;


--
-- Name: domain; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.domain (
    id integer NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    attrs character varying(255) DEFAULT NULL::character varying,
    last_modified timestamp without time zone DEFAULT '1900-01-01 00:00:01'::timestamp without time zone NOT NULL
);


ALTER TABLE public.domain OWNER TO postgres;

--
-- Name: domain_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domain_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.domain_id_seq OWNER TO postgres;

--
-- Name: domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domain_id_seq OWNED BY public.domain.id;


--
-- Name: domainpolicy; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.domainpolicy (
    id integer NOT NULL,
    rule character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    att character varying(255),
    val character varying(128),
    description character varying(255) NOT NULL
);


ALTER TABLE public.domainpolicy OWNER TO postgres;

--
-- Name: domainpolicy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domainpolicy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.domainpolicy_id_seq OWNER TO postgres;

--
-- Name: domainpolicy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domainpolicy_id_seq OWNED BY public.domainpolicy.id;


--
-- Name: dp_id; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE public.dp_id (
    id bigint NOT NULL,
    grp integer,
    attrs character varying(40),
    description character varying(128)
);


ALTER TABLE public.dp_id OWNER TO admin;

--
-- Name: dp_id_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.dp_id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dp_id_id_seq OWNER TO admin;

--
-- Name: dp_id_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.dp_id_id_seq OWNED BY public.dp_id.id;


--
-- Name: dr_carriers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dr_carriers (
    id integer NOT NULL,
    carrierid character varying(64) NOT NULL,
    gwlist character varying(255) NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    attrs character varying(255) DEFAULT NULL::character varying,
    description character varying(128) DEFAULT NULL::character varying,
    sort_alg character varying(1) DEFAULT 'N'::character varying
);


ALTER TABLE public.dr_carriers OWNER TO postgres;

--
-- Name: dr_carriers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dr_carriers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dr_carriers_id_seq OWNER TO postgres;

--
-- Name: dr_carriers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dr_carriers_id_seq OWNED BY public.dr_carriers.id;


--
-- Name: dr_gateways; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dr_gateways (
    id integer NOT NULL,
    gwid character varying(64) NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    address character varying(128) NOT NULL,
    strip integer DEFAULT 0 NOT NULL,
    pri_prefix character varying(16) DEFAULT NULL::character varying,
    attrs character varying(255) DEFAULT NULL::character varying,
    probe_mode integer DEFAULT 0 NOT NULL,
    state integer DEFAULT 0 NOT NULL,
    socket character varying(128) DEFAULT NULL::character varying,
    description character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.dr_gateways OWNER TO postgres;

--
-- Name: dr_gateways_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dr_gateways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dr_gateways_id_seq OWNER TO postgres;

--
-- Name: dr_gateways_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dr_gateways_id_seq OWNED BY public.dr_gateways.id;


--
-- Name: dr_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dr_groups (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    domain character varying(128) DEFAULT NULL::character varying,
    groupid integer DEFAULT 0 NOT NULL,
    description character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.dr_groups OWNER TO postgres;

--
-- Name: dr_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dr_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dr_groups_id_seq OWNER TO postgres;

--
-- Name: dr_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dr_groups_id_seq OWNED BY public.dr_groups.id;


--
-- Name: dr_partitions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dr_partitions (
    id integer NOT NULL,
    partition_name character varying(255) NOT NULL,
    db_url character varying(255) NOT NULL,
    drd_table character varying(255),
    drr_table character varying(255),
    drg_table character varying(255),
    drc_table character varying(255),
    ruri_avp character varying(255),
    gw_id_avp character varying(255),
    gw_priprefix_avp character varying(255),
    gw_sock_avp character varying(255),
    rule_id_avp character varying(255),
    rule_prefix_avp character varying(255),
    carrier_id_avp character varying(255)
);


ALTER TABLE public.dr_partitions OWNER TO postgres;

--
-- Name: dr_partitions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dr_partitions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dr_partitions_id_seq OWNER TO postgres;

--
-- Name: dr_partitions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dr_partitions_id_seq OWNED BY public.dr_partitions.id;


--
-- Name: dr_rules; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.dr_rules (
    ruleid integer NOT NULL,
    groupid character varying(255) NOT NULL,
    prefix character varying(64) NOT NULL,
    timerec character varying(255) DEFAULT NULL::character varying,
    priority integer DEFAULT 0 NOT NULL,
    routeid character varying(255) DEFAULT NULL::character varying,
    gwlist character varying(255) NOT NULL,
    attrs character varying(255) DEFAULT NULL::character varying,
    description character varying(128) DEFAULT NULL::character varying,
    sort_alg character varying(1) DEFAULT 'N'::character varying NOT NULL,
    sort_profile integer
);


ALTER TABLE public.dr_rules OWNER TO postgres;

--
-- Name: dr_rules_ruleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dr_rules_ruleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.dr_rules_ruleid_seq OWNER TO postgres;

--
-- Name: dr_rules_ruleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dr_rules_ruleid_seq OWNED BY public.dr_rules.ruleid;


--
-- Name: emergency_report; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.emergency_report (
    id integer NOT NULL,
    callid character varying(25) NOT NULL,
    selectiveroutingid character varying(11) NOT NULL,
    routingesn integer DEFAULT 0 NOT NULL,
    npa integer DEFAULT 0 NOT NULL,
    esgwri character varying(50) NOT NULL,
    lro character varying(20) NOT NULL,
    vpc_organizationname character varying(50) NOT NULL,
    vpc_hostname character varying(50) NOT NULL,
    vpc_timestamp character varying(30) NOT NULL,
    result character varying(4) NOT NULL,
    disposition character varying(10) NOT NULL
);


ALTER TABLE public.emergency_report OWNER TO postgres;

--
-- Name: emergency_report_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emergency_report_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.emergency_report_id_seq OWNER TO postgres;

--
-- Name: emergency_report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emergency_report_id_seq OWNED BY public.emergency_report.id;


--
-- Name: emergency_routing; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.emergency_routing (
    id integer NOT NULL,
    selectiveroutingid character varying(11) NOT NULL,
    routingesn integer DEFAULT 0 NOT NULL,
    npa integer DEFAULT 0 NOT NULL,
    esgwri character varying(50) NOT NULL
);


ALTER TABLE public.emergency_routing OWNER TO postgres;

--
-- Name: emergency_routing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emergency_routing_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.emergency_routing_id_seq OWNER TO postgres;

--
-- Name: emergency_routing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emergency_routing_id_seq OWNED BY public.emergency_routing.id;


--
-- Name: emergency_service_provider; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.emergency_service_provider (
    id integer NOT NULL,
    organizationname character varying(50) NOT NULL,
    hostid character varying(30) NOT NULL,
    nenaid character varying(50) NOT NULL,
    contact character varying(20) NOT NULL,
    certuri character varying(50) NOT NULL,
    nodeip character varying(20) NOT NULL,
    attribution integer NOT NULL
);


ALTER TABLE public.emergency_service_provider OWNER TO postgres;

--
-- Name: emergency_service_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.emergency_service_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.emergency_service_provider_id_seq OWNER TO postgres;

--
-- Name: emergency_service_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.emergency_service_provider_id_seq OWNED BY public.emergency_service_provider.id;


--
-- Name: fraud_detection; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.fraud_detection (
    ruleid integer NOT NULL,
    profileid integer NOT NULL,
    prefix character varying(64) NOT NULL,
    start_hour character varying(5) NOT NULL,
    end_hour character varying(5) NOT NULL,
    daysoftheweek character varying(64) NOT NULL,
    cpm_warning integer NOT NULL,
    cpm_critical integer NOT NULL,
    call_duration_warning integer NOT NULL,
    call_duration_critical integer NOT NULL,
    total_calls_warning integer NOT NULL,
    total_calls_critical integer NOT NULL,
    concurrent_calls_warning integer NOT NULL,
    concurrent_calls_critical integer NOT NULL,
    sequential_calls_warning integer NOT NULL,
    sequential_calls_critical integer NOT NULL
);


ALTER TABLE public.fraud_detection OWNER TO postgres;

--
-- Name: fraud_detection_ruleid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fraud_detection_ruleid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.fraud_detection_ruleid_seq OWNER TO postgres;

--
-- Name: fraud_detection_ruleid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.fraud_detection_ruleid_seq OWNED BY public.fraud_detection.ruleid;


--
-- Name: freeswitch; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.freeswitch (
    id integer NOT NULL,
    username character varying(64),
    password character varying(64) NOT NULL,
    ip character varying(20) NOT NULL,
    port integer DEFAULT 8021 NOT NULL,
    events_csv character varying(255)
);


ALTER TABLE public.freeswitch OWNER TO postgres;

--
-- Name: freeswitch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.freeswitch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.freeswitch_id_seq OWNER TO postgres;

--
-- Name: freeswitch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.freeswitch_id_seq OWNED BY public.freeswitch.id;


--
-- Name: globalblacklist; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.globalblacklist (
    id integer NOT NULL,
    prefix character varying(64) DEFAULT ''::character varying NOT NULL,
    whitelist smallint DEFAULT 0 NOT NULL,
    description character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.globalblacklist OWNER TO postgres;

--
-- Name: globalblacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.globalblacklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.globalblacklist_id_seq OWNER TO postgres;

--
-- Name: globalblacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.globalblacklist_id_seq OWNED BY public.globalblacklist.id;


--
-- Name: grp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.grp (
    id integer NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    grp character varying(64) DEFAULT ''::character varying NOT NULL,
    last_modified timestamp without time zone DEFAULT '1900-01-01 00:00:01'::timestamp without time zone NOT NULL
);


ALTER TABLE public.grp OWNER TO postgres;

--
-- Name: grp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.grp_id_seq OWNER TO postgres;

--
-- Name: grp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grp_id_seq OWNED BY public.grp.id;


--
-- Name: imc_members; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.imc_members (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    domain character varying(64) NOT NULL,
    room character varying(64) NOT NULL,
    flag integer NOT NULL
);


ALTER TABLE public.imc_members OWNER TO postgres;

--
-- Name: imc_members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imc_members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.imc_members_id_seq OWNER TO postgres;

--
-- Name: imc_members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imc_members_id_seq OWNED BY public.imc_members.id;


--
-- Name: imc_rooms; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.imc_rooms (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    domain character varying(64) NOT NULL,
    flag integer NOT NULL
);


ALTER TABLE public.imc_rooms OWNER TO postgres;

--
-- Name: imc_rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imc_rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.imc_rooms_id_seq OWNER TO postgres;

--
-- Name: imc_rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imc_rooms_id_seq OWNED BY public.imc_rooms.id;


--
-- Name: load_balancer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.load_balancer (
    id integer NOT NULL,
    group_id integer DEFAULT 0 NOT NULL,
    dst_uri character varying(128) NOT NULL,
    resources character varying(255) NOT NULL,
    probe_mode integer DEFAULT 0 NOT NULL,
    description character varying(128) DEFAULT NULL::character varying,
    attrs character varying(120) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.load_balancer OWNER TO postgres;

--
-- Name: load_balancer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.load_balancer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.load_balancer_id_seq OWNER TO postgres;

--
-- Name: load_balancer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.load_balancer_id_seq OWNED BY public.load_balancer.id;


--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.location (
    contact_id bigint NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT NULL::character varying,
    contact character varying(255) DEFAULT ''::character varying NOT NULL,
    received character varying(128) DEFAULT NULL::character varying,
    path character varying(255) DEFAULT NULL::character varying,
    expires integer NOT NULL,
    q real DEFAULT 1.0 NOT NULL,
    callid character varying(255) DEFAULT 'Default-Call-ID'::character varying NOT NULL,
    cseq integer DEFAULT 13 NOT NULL,
    last_modified timestamp without time zone DEFAULT '1900-01-01 00:00:01'::timestamp without time zone NOT NULL,
    flags integer DEFAULT 0 NOT NULL,
    cflags character varying(255) DEFAULT NULL::character varying,
    user_agent character varying(255) DEFAULT ''::character varying NOT NULL,
    socket character varying(64) DEFAULT NULL::character varying,
    methods integer,
    sip_instance character varying(255) DEFAULT NULL::character varying,
    kv_store text,
    attr character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.location OWNER TO postgres;

--
-- Name: location_contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.location_contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.location_contact_id_seq OWNER TO postgres;

--
-- Name: location_contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.location_contact_id_seq OWNED BY public.location.contact_id;


--
-- Name: missed_calls; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.missed_calls (
    id integer NOT NULL,
    method character varying(16) DEFAULT ''::character varying NOT NULL,
    from_tag character varying(64) DEFAULT ''::character varying NOT NULL,
    to_tag character varying(64) DEFAULT ''::character varying NOT NULL,
    callid character varying(64) DEFAULT ''::character varying NOT NULL,
    sip_code character varying(3) DEFAULT ''::character varying NOT NULL,
    sip_reason character varying(32) DEFAULT ''::character varying NOT NULL,
    "time" timestamp without time zone NOT NULL,
    duration integer DEFAULT 0 NOT NULL,
    ms_duration integer DEFAULT 0 NOT NULL,
    setuptime integer DEFAULT 0 NOT NULL,
    created character varying DEFAULT to_char(now(), 'HH24:MI:SS'::text),
    ani character varying(120) NOT NULL,
    rdnis_outbound character varying(120) NOT NULL,
    rdnis_inbound character varying(120) NOT NULL,
    gw_outbound character varying,
    "end" character varying DEFAULT to_char(now(), 'YYYY-MM-DD HH24:MI:SS'::text)
);


ALTER TABLE public.missed_calls OWNER TO postgres;

--
-- Name: missed_calls_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.missed_calls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.missed_calls_id_seq OWNER TO postgres;

--
-- Name: missed_calls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.missed_calls_id_seq OWNED BY public.missed_calls.id;


--
-- Name: networks; Type: TABLE; Schema: public; Owner: admin; Tablespace: 
--

CREATE TABLE public.networks (
    id integer NOT NULL,
    grp smallint DEFAULT 0 NOT NULL,
    ip character varying(50) NOT NULL,
    mask smallint DEFAULT 32 NOT NULL,
    port smallint DEFAULT 0 NOT NULL,
    proto character varying(4) DEFAULT 'any'::character varying NOT NULL,
    pattern character varying(64) DEFAULT NULL::character varying,
    context_info character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE public.networks OWNER TO admin;

--
-- Name: networks_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.networks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.networks_id_seq OWNER TO admin;

--
-- Name: networks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.networks_id_seq OWNED BY public.networks.id;


--
-- Name: presentity; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.presentity (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    domain character varying(64) NOT NULL,
    event character varying(64) NOT NULL,
    etag character varying(64) NOT NULL,
    expires integer NOT NULL,
    received_time integer NOT NULL,
    body bytea,
    extra_hdrs bytea,
    sender character varying(128) DEFAULT NULL::character varying
);


ALTER TABLE public.presentity OWNER TO postgres;

--
-- Name: presentity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presentity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.presentity_id_seq OWNER TO postgres;

--
-- Name: presentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presentity_id_seq OWNED BY public.presentity.id;


--
-- Name: pua; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.pua (
    id integer NOT NULL,
    pres_uri character varying(128) NOT NULL,
    pres_id character varying(255) NOT NULL,
    event integer NOT NULL,
    expires integer NOT NULL,
    desired_expires integer NOT NULL,
    flag integer NOT NULL,
    etag character varying(64),
    tuple_id character varying(64),
    watcher_uri character varying(128),
    to_uri character varying(128),
    call_id character varying(64),
    to_tag character varying(64),
    from_tag character varying(64),
    cseq integer,
    record_route text,
    contact character varying(128),
    remote_contact character varying(128),
    version integer,
    extra_headers text
);


ALTER TABLE public.pua OWNER TO postgres;

--
-- Name: pua_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pua_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.pua_id_seq OWNER TO postgres;

--
-- Name: pua_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pua_id_seq OWNED BY public.pua.id;


--
-- Name: re_grp; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.re_grp (
    id integer NOT NULL,
    reg_exp character varying(128) DEFAULT ''::character varying NOT NULL,
    group_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.re_grp OWNER TO postgres;

--
-- Name: re_grp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.re_grp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.re_grp_id_seq OWNER TO postgres;

--
-- Name: re_grp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.re_grp_id_seq OWNED BY public.re_grp.id;


--
-- Name: registrant; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.registrant (
    id integer NOT NULL,
    registrar character varying(128) DEFAULT ''::character varying NOT NULL,
    proxy character varying(128) DEFAULT NULL::character varying,
    aor character varying(128) DEFAULT ''::character varying NOT NULL,
    third_party_registrant character varying(128) DEFAULT NULL::character varying,
    username character varying(64) DEFAULT NULL::character varying,
    password character varying(64) DEFAULT NULL::character varying,
    binding_uri character varying(128) DEFAULT ''::character varying NOT NULL,
    binding_params character varying(64) DEFAULT NULL::character varying,
    expiry integer,
    forced_socket character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.registrant OWNER TO postgres;

--
-- Name: registrant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registrant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.registrant_id_seq OWNER TO postgres;

--
-- Name: registrant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registrant_id_seq OWNED BY public.registrant.id;


--
-- Name: rls_presentity; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.rls_presentity (
    id integer NOT NULL,
    rlsubs_did character varying(255) NOT NULL,
    resource_uri character varying(128) NOT NULL,
    content_type character varying(255) NOT NULL,
    presence_state bytea NOT NULL,
    expires integer NOT NULL,
    updated integer NOT NULL,
    auth_state integer NOT NULL,
    reason character varying(64) NOT NULL
);


ALTER TABLE public.rls_presentity OWNER TO postgres;

--
-- Name: rls_presentity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rls_presentity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.rls_presentity_id_seq OWNER TO postgres;

--
-- Name: rls_presentity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rls_presentity_id_seq OWNED BY public.rls_presentity.id;


--
-- Name: rls_watchers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.rls_watchers (
    id integer NOT NULL,
    presentity_uri character varying(128) NOT NULL,
    to_user character varying(64) NOT NULL,
    to_domain character varying(64) NOT NULL,
    watcher_username character varying(64) NOT NULL,
    watcher_domain character varying(64) NOT NULL,
    event character varying(64) DEFAULT 'presence'::character varying NOT NULL,
    event_id character varying(64),
    to_tag character varying(64) NOT NULL,
    from_tag character varying(64) NOT NULL,
    callid character varying(64) NOT NULL,
    local_cseq integer NOT NULL,
    remote_cseq integer NOT NULL,
    contact character varying(64) NOT NULL,
    record_route text,
    expires integer NOT NULL,
    status integer DEFAULT 2 NOT NULL,
    reason character varying(64) NOT NULL,
    version integer DEFAULT 0 NOT NULL,
    socket_info character varying(64) NOT NULL,
    local_contact character varying(128) NOT NULL
);


ALTER TABLE public.rls_watchers OWNER TO postgres;

--
-- Name: rls_watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rls_watchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.rls_watchers_id_seq OWNER TO postgres;

--
-- Name: rls_watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rls_watchers_id_seq OWNED BY public.rls_watchers.id;


--
-- Name: route_tree; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.route_tree (
    id integer NOT NULL,
    carrier character varying(64) DEFAULT NULL::character varying
);


ALTER TABLE public.route_tree OWNER TO postgres;

--
-- Name: route_tree_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.route_tree_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.route_tree_id_seq OWNER TO postgres;

--
-- Name: route_tree_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.route_tree_id_seq OWNED BY public.route_tree.id;


--
-- Name: rtpengine; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.rtpengine (
    id integer NOT NULL,
    socket text NOT NULL,
    set_id integer NOT NULL,
    weight integer DEFAULT 1 NOT NULL,
    disabled integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.rtpengine OWNER TO postgres;

--
-- Name: rtpengine_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rtpengine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.rtpengine_id_seq OWNER TO postgres;

--
-- Name: rtpengine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rtpengine_id_seq OWNED BY public.rtpengine.id;


--
-- Name: rtpproxy_sockets; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.rtpproxy_sockets (
    id integer NOT NULL,
    rtpproxy_sock text NOT NULL,
    set_id integer NOT NULL
);


ALTER TABLE public.rtpproxy_sockets OWNER TO postgres;

--
-- Name: rtpproxy_sockets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rtpproxy_sockets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.rtpproxy_sockets_id_seq OWNER TO postgres;

--
-- Name: rtpproxy_sockets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rtpproxy_sockets_id_seq OWNED BY public.rtpproxy_sockets.id;


--
-- Name: silo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.silo (
    id integer NOT NULL,
    src_addr character varying(128) DEFAULT ''::character varying NOT NULL,
    dst_addr character varying(128) DEFAULT ''::character varying NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    inc_time integer DEFAULT 0 NOT NULL,
    exp_time integer DEFAULT 0 NOT NULL,
    snd_time integer DEFAULT 0 NOT NULL,
    ctype character varying(255) DEFAULT NULL::character varying,
    body bytea
);


ALTER TABLE public.silo OWNER TO postgres;

--
-- Name: silo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.silo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.silo_id_seq OWNER TO postgres;

--
-- Name: silo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.silo_id_seq OWNED BY public.silo.id;


--
-- Name: sip_trace; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.sip_trace (
    id integer NOT NULL,
    time_stamp timestamp without time zone DEFAULT '1900-01-01 00:00:01'::timestamp without time zone NOT NULL,
    callid character varying(255) DEFAULT ''::character varying NOT NULL,
    trace_attrs character varying(128) DEFAULT NULL::character varying,
    msg text NOT NULL,
    method character varying(32) DEFAULT ''::character varying NOT NULL,
    status character varying(128) DEFAULT NULL::character varying,
    from_proto character varying(5) NOT NULL,
    from_ip character varying(50) DEFAULT ''::character varying NOT NULL,
    from_port integer NOT NULL,
    to_proto character varying(5) NOT NULL,
    to_ip character varying(50) DEFAULT ''::character varying NOT NULL,
    to_port integer NOT NULL,
    fromtag character varying(64) DEFAULT ''::character varying NOT NULL,
    direction character varying(4) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.sip_trace OWNER TO postgres;

--
-- Name: sip_trace_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sip_trace_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.sip_trace_id_seq OWNER TO postgres;

--
-- Name: sip_trace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sip_trace_id_seq OWNED BY public.sip_trace.id;


--
-- Name: speed_dial; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.speed_dial (
    id integer NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    sd_username character varying(64) DEFAULT ''::character varying NOT NULL,
    sd_domain character varying(64) DEFAULT ''::character varying NOT NULL,
    new_uri character varying(128) DEFAULT ''::character varying NOT NULL,
    fname character varying(64) DEFAULT ''::character varying NOT NULL,
    lname character varying(64) DEFAULT ''::character varying NOT NULL,
    description character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE public.speed_dial OWNER TO postgres;

--
-- Name: speed_dial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.speed_dial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.speed_dial_id_seq OWNER TO postgres;

--
-- Name: speed_dial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.speed_dial_id_seq OWNED BY public.speed_dial.id;


--
-- Name: subscriber; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.subscriber (
    id integer NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    password character varying(25) DEFAULT ''::character varying NOT NULL,
    email_address character varying(64) DEFAULT ''::character varying NOT NULL,
    ha1 character varying(64) DEFAULT ''::character varying NOT NULL,
    ha1b character varying(64) DEFAULT ''::character varying NOT NULL,
    rpid character varying(64) DEFAULT NULL::character varying,
    privacy character varying(256) DEFAULT NULL::character varying
);


ALTER TABLE public.subscriber OWNER TO postgres;

--
-- Name: subscriber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subscriber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.subscriber_id_seq OWNER TO postgres;

--
-- Name: subscriber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subscriber_id_seq OWNED BY public.subscriber.id;


--
-- Name: tls_mgm; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.tls_mgm (
    id integer NOT NULL,
    domain character varying(64) NOT NULL,
    address character varying(64) DEFAULT NULL::character varying,
    type integer DEFAULT 1 NOT NULL,
    method character varying(16) DEFAULT 'SSLv23'::character varying,
    verify_cert integer DEFAULT 1,
    require_cert integer DEFAULT 1,
    certificate bytea,
    private_key bytea,
    crl_check_all integer DEFAULT 0,
    crl_dir character varying(255) DEFAULT NULL::character varying,
    ca_list bytea,
    ca_dir character varying(255) DEFAULT NULL::character varying,
    cipher_list character varying(255) DEFAULT NULL::character varying,
    dh_params bytea,
    ec_curve character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public.tls_mgm OWNER TO postgres;

--
-- Name: tls_mgm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tls_mgm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.tls_mgm_id_seq OWNER TO postgres;

--
-- Name: tls_mgm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tls_mgm_id_seq OWNED BY public.tls_mgm.id;


--
-- Name: uri; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.uri (
    id integer NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    uri_user character varying(64) DEFAULT ''::character varying NOT NULL,
    last_modified timestamp without time zone DEFAULT '1900-01-01 00:00:01'::timestamp without time zone NOT NULL
);


ALTER TABLE public.uri OWNER TO postgres;

--
-- Name: uri_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.uri_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.uri_id_seq OWNER TO postgres;

--
-- Name: uri_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.uri_id_seq OWNED BY public.uri.id;


--
-- Name: userblacklist; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.userblacklist (
    id integer NOT NULL,
    username character varying(64) DEFAULT ''::character varying NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    prefix character varying(64) DEFAULT ''::character varying NOT NULL,
    whitelist smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public.userblacklist OWNER TO postgres;

--
-- Name: userblacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.userblacklist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.userblacklist_id_seq OWNER TO postgres;

--
-- Name: userblacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.userblacklist_id_seq OWNED BY public.userblacklist.id;


--
-- Name: usr_preferences; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.usr_preferences (
    id integer NOT NULL,
    uuid character varying(64) DEFAULT ''::character varying NOT NULL,
    username character varying(128) DEFAULT 0 NOT NULL,
    domain character varying(64) DEFAULT ''::character varying NOT NULL,
    attribute character varying(32) DEFAULT ''::character varying NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    value character varying(128) DEFAULT ''::character varying NOT NULL,
    last_modified timestamp without time zone DEFAULT '1900-01-01 00:00:01'::timestamp without time zone NOT NULL
);


ALTER TABLE public.usr_preferences OWNER TO postgres;

--
-- Name: usr_preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usr_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.usr_preferences_id_seq OWNER TO postgres;

--
-- Name: usr_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usr_preferences_id_seq OWNED BY public.usr_preferences.id;


--
-- Name: version; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.version (
    table_name character varying(32) NOT NULL,
    table_version integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.version OWNER TO postgres;

--
-- Name: watchers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.watchers (
    id integer NOT NULL,
    presentity_uri character varying(128) NOT NULL,
    watcher_username character varying(64) NOT NULL,
    watcher_domain character varying(64) NOT NULL,
    event character varying(64) DEFAULT 'presence'::character varying NOT NULL,
    status integer NOT NULL,
    reason character varying(64),
    inserted_time integer NOT NULL
);


ALTER TABLE public.watchers OWNER TO postgres;

--
-- Name: watchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.watchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.watchers_id_seq OWNER TO postgres;

--
-- Name: watchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.watchers_id_seq OWNED BY public.watchers.id;


--
-- Name: xcap; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE public.xcap (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    domain character varying(64) NOT NULL,
    doc bytea NOT NULL,
    doc_type integer NOT NULL,
    etag character varying(64) NOT NULL,
    source integer NOT NULL,
    doc_uri character varying(128) NOT NULL,
    port integer NOT NULL
);


ALTER TABLE public.xcap OWNER TO postgres;

--
-- Name: xcap_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.xcap_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1
    CYCLE;


ALTER TABLE public.xcap_id_seq OWNER TO postgres;

--
-- Name: xcap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.xcap_id_seq OWNED BY public.xcap.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.acc ALTER COLUMN id SET DEFAULT nextval('public.acc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.active_watchers ALTER COLUMN id SET DEFAULT nextval('public.active_watchers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.b2b_entities ALTER COLUMN id SET DEFAULT nextval('public.b2b_entities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.b2b_logic ALTER COLUMN id SET DEFAULT nextval('public.b2b_logic_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.b2b_sca ALTER COLUMN id SET DEFAULT nextval('public.b2b_sca_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.call_mos ALTER COLUMN id SET DEFAULT nextval('public.call_mos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrierfailureroute ALTER COLUMN id SET DEFAULT nextval('public.carrierfailureroute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carrierroute ALTER COLUMN id SET DEFAULT nextval('public.carrierroute_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cc_agents ALTER COLUMN id SET DEFAULT nextval('public.cc_agents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cc_calls ALTER COLUMN id SET DEFAULT nextval('public.cc_calls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cc_cdrs ALTER COLUMN id SET DEFAULT nextval('public.cc_cdrs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cc_flows ALTER COLUMN id SET DEFAULT nextval('public.cc_flows_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.closeddial ALTER COLUMN id SET DEFAULT nextval('public.closeddial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clusterer ALTER COLUMN id SET DEFAULT nextval('public.clusterer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpl ALTER COLUMN id SET DEFAULT nextval('public.cpl_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dbaliases ALTER COLUMN id SET DEFAULT nextval('public.dbaliases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dialplan ALTER COLUMN id SET DEFAULT nextval('public.dialplan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dialplan_local ALTER COLUMN id SET DEFAULT nextval('public.dialplan_local_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dispatcher ALTER COLUMN id SET DEFAULT nextval('public.dispatcher_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domain ALTER COLUMN id SET DEFAULT nextval('public.domain_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domainpolicy ALTER COLUMN id SET DEFAULT nextval('public.domainpolicy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.dp_id ALTER COLUMN id SET DEFAULT nextval('public.dp_id_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dr_carriers ALTER COLUMN id SET DEFAULT nextval('public.dr_carriers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dr_gateways ALTER COLUMN id SET DEFAULT nextval('public.dr_gateways_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dr_groups ALTER COLUMN id SET DEFAULT nextval('public.dr_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dr_partitions ALTER COLUMN id SET DEFAULT nextval('public.dr_partitions_id_seq'::regclass);


--
-- Name: ruleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dr_rules ALTER COLUMN ruleid SET DEFAULT nextval('public.dr_rules_ruleid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergency_report ALTER COLUMN id SET DEFAULT nextval('public.emergency_report_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergency_routing ALTER COLUMN id SET DEFAULT nextval('public.emergency_routing_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergency_service_provider ALTER COLUMN id SET DEFAULT nextval('public.emergency_service_provider_id_seq'::regclass);


--
-- Name: ruleid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fraud_detection ALTER COLUMN ruleid SET DEFAULT nextval('public.fraud_detection_ruleid_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.freeswitch ALTER COLUMN id SET DEFAULT nextval('public.freeswitch_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.globalblacklist ALTER COLUMN id SET DEFAULT nextval('public.globalblacklist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grp ALTER COLUMN id SET DEFAULT nextval('public.grp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imc_members ALTER COLUMN id SET DEFAULT nextval('public.imc_members_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imc_rooms ALTER COLUMN id SET DEFAULT nextval('public.imc_rooms_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.load_balancer ALTER COLUMN id SET DEFAULT nextval('public.load_balancer_id_seq'::regclass);


--
-- Name: contact_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.location ALTER COLUMN contact_id SET DEFAULT nextval('public.location_contact_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.missed_calls ALTER COLUMN id SET DEFAULT nextval('public.missed_calls_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.networks ALTER COLUMN id SET DEFAULT nextval('public.networks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentity ALTER COLUMN id SET DEFAULT nextval('public.presentity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pua ALTER COLUMN id SET DEFAULT nextval('public.pua_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.re_grp ALTER COLUMN id SET DEFAULT nextval('public.re_grp_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registrant ALTER COLUMN id SET DEFAULT nextval('public.registrant_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_presentity ALTER COLUMN id SET DEFAULT nextval('public.rls_presentity_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rls_watchers ALTER COLUMN id SET DEFAULT nextval('public.rls_watchers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_tree ALTER COLUMN id SET DEFAULT nextval('public.route_tree_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rtpengine ALTER COLUMN id SET DEFAULT nextval('public.rtpengine_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rtpproxy_sockets ALTER COLUMN id SET DEFAULT nextval('public.rtpproxy_sockets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.silo ALTER COLUMN id SET DEFAULT nextval('public.silo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sip_trace ALTER COLUMN id SET DEFAULT nextval('public.sip_trace_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.speed_dial ALTER COLUMN id SET DEFAULT nextval('public.speed_dial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriber ALTER COLUMN id SET DEFAULT nextval('public.subscriber_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tls_mgm ALTER COLUMN id SET DEFAULT nextval('public.tls_mgm_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.uri ALTER COLUMN id SET DEFAULT nextval('public.uri_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userblacklist ALTER COLUMN id SET DEFAULT nextval('public.userblacklist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usr_preferences ALTER COLUMN id SET DEFAULT nextval('public.usr_preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.watchers ALTER COLUMN id SET DEFAULT nextval('public.watchers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.xcap ALTER COLUMN id SET DEFAULT nextval('public.xcap_id_seq'::regclass);


--
-- Data for Name: acc; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.acc VALUES (1165, 'BYE', '3799659698-804372987', 'as126b9944', '489581143-3799659698-1590189235@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:01:47', 0, 0, 0, '10:05:02', '', '', '', '', '2020-05-28 10:05:02');
INSERT INTO public.acc VALUES (1166, 'INVITE', '3799659802-979003326', 'as04bdfdea', '489589675-3799659802-1615964265@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:03:22', 21, 20860, 0, '2020-05-28 10:03:22', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:06:58');
INSERT INTO public.acc VALUES (1167, 'INVITE', '3799660020-1805814016', 'as3f6f6a94', '489607126-3799660020-942289391@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:07:00', 39, 38675, 0, '2020-05-28 10:07:00', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:10:54');
INSERT INTO public.acc VALUES (1168, 'INVITE', '3799660086-1591308641', 'as2a438a55', '489612228-3799660086-184106656@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:08:06', 21, 21158, 0, '2020-05-28 10:08:06', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:11:42');
INSERT INTO public.acc VALUES (1169, 'INVITE', '3799660698-1493589689', 'as3b9b3a87', '489659767-3799660698-922674618@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:18:18', 12, 11648, 0, '2020-05-28 10:18:18', '61981203815', '8850', '8392', 'sip:10.123.125.81:5060', '2020-05-28 10:21:45');
INSERT INTO public.acc VALUES (1170, 'INVITE', '3799660724-1031013146', 'as52435e6e', '489662032-3799660724-889311388@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:18:44', 6, 6112, 0, '2020-05-28 10:18:44', '61981203815', '8850', '8392', 'sip:10.123.125.81:5060', '2020-05-28 10:22:06');
INSERT INTO public.acc VALUES (1171, 'INVITE', '3799660820-1100216487', 'as58761e76', '489669365-3799660820-663910291@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:20:20', 8, 7360, 0, '2020-05-28 10:20:20', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:23:43');
INSERT INTO public.acc VALUES (1172, 'INVITE', '3799662174-710637626', 'as19dcaade', '489775065-3799662174-584813797@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:42:54', 9, 8983, 0, '2020-05-28 10:42:54', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:46:18');
INSERT INTO public.acc VALUES (1173, 'INVITE', '3799662443-327261049', 'as1f18035a', '489796113-3799662443-483005719@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:47:23', 7, 6987, 0, '2020-05-28 10:47:23', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:50:45');
INSERT INTO public.acc VALUES (1174, 'INVITE', '3799662604-1851280498', 'as581a477b', '489808632-3799662604-228393966@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:50:04', 10, 10586, 0, '2020-05-28 10:50:04', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:53:30');
INSERT INTO public.acc VALUES (1175, 'INVITE', '3799662672-277805306', 'as2d4da774', '489813980-3799662672-1384942484@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:51:12', 5, 5247, 0, '2020-05-28 10:51:12', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:54:32');
INSERT INTO public.acc VALUES (1176, 'INVITE', '3799662797-1607674014', 'as720081d6', '489823890-3799662797-1089708205@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:53:17', 6, 5217, 0, '2020-05-28 10:53:17', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 10:56:38');
INSERT INTO public.acc VALUES (1177, 'INVITE', '3799663133-1185730251', 'as50bac7ff', '489849641-3799663133-1642446482@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 10:58:53', 7, 7033, 0, '2020-05-28 10:58:53', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 11:02:15');
INSERT INTO public.acc VALUES (1178, 'INVITE', '3799663343-284493657', 'as57fa2ac0', '489865662-3799663343-1694698524@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:02:24', 9, 9396, 0, '2020-05-28 11:02:24', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 11:05:48');
INSERT INTO public.acc VALUES (1179, 'INVITE', '3799664550-321111998', 'as5d4dc4c4', '489956370-3799664550-1011022200@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:22:30', 7, 6265, 0, '2020-05-28 11:22:30', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 11:25:52');
INSERT INTO public.acc VALUES (1180, 'INVITE', '3799664677-1528686443', 'as034db061', '489965728-3799664677-1719871976@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:24:37', 8, 7534, 0, '2020-05-28 11:24:37', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 11:28:00');
INSERT INTO public.acc VALUES (1181, 'INVITE', '3799665078-229645757', 'as0c9bc0af', '489994509-3799665078-285959248@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:31:18', 9, 8476, 0, '2020-05-28 11:31:18', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 11:34:42');
INSERT INTO public.acc VALUES (1182, 'INVITE', '3799665296-2046488973', 'as01fa8237', '490009410-3799665296-689395282@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:34:56', 7, 6442, 0, '2020-05-28 11:34:56', '61981203815', '8850', '8392', 'sip:10.123.125.81:5060', '2020-05-28 11:38:18');
INSERT INTO public.acc VALUES (1183, 'INVITE', '3799665316-975524200', 'as3a5de5f5', '490010725-3799665316-1226911752@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:35:16', 6, 5800, 0, '2020-05-28 11:35:16', '61981203815', '8850', '8392', 'sip:10.123.125.81:5060', '2020-05-28 11:38:37');
INSERT INTO public.acc VALUES (1184, 'INVITE', '3799665341-209755621', 'as74bcc384', '490012457-3799665341-535652300@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:35:41', 11, 11598, 0, '2020-05-28 11:35:41', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 11:39:08');
INSERT INTO public.acc VALUES (1185, 'INVITE', '3799665436-1246517249', 'as51bb8508', '490019675-3799665436-107789199@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:37:16', 7, 6522, 0, '2020-05-28 11:37:16', '61981203815', '8850', '8392', 'sip:10.123.125.81:5060', '2020-05-28 11:40:38');
INSERT INTO public.acc VALUES (1186, 'INVITE', '3799665457-157453309', 'as2239750c', '490021333-3799665457-708181951@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 11:37:37', 9, 8416, 0, '2020-05-28 11:37:37', '61981203815', '8850', '8392', 'sip:10.123.125.83:5060', '2020-05-28 11:41:01');
INSERT INTO public.acc VALUES (1187, 'INVITE', '3799668254-80576212', 'as35f27287', '490225247-3799668254-1345977235@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 12:24:14', 56, 55707, 0, '2020-05-28 12:24:14', '82996831899', '8850', '8392', 'sip:10.123.125.81:5060', '2020-05-28 12:28:25');
INSERT INTO public.acc VALUES (1188, 'INVITE', '3799675887-1460182607', '', '490761453-3799675887-682788009@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 14:31:27', 0, 0, 0, '14:34:43', NULL, NULL, NULL, NULL, '2020-05-28 14:34:43');
INSERT INTO public.acc VALUES (1189, 'INVITE', '3799675943-1499216832', '', '490764841-3799675943-579799706@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 14:32:23', 0, 0, 0, '14:35:39', NULL, NULL, NULL, NULL, '2020-05-28 14:35:39');
INSERT INTO public.acc VALUES (1190, 'INVITE', '3799676039-1398369297', '', '490770842-3799676039-1129373118@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 14:33:59', 0, 0, 0, '14:37:14', NULL, NULL, NULL, NULL, '2020-05-28 14:37:14');
INSERT INTO public.acc VALUES (1191, 'INVITE', '3799676124-1084581047', '', '490775886-3799676124-935465636@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 14:35:25', 0, 0, 0, '14:38:40', NULL, NULL, NULL, NULL, '2020-05-28 14:38:40');
INSERT INTO public.acc VALUES (1192, 'INVITE', '3799676256-1013922514', '', '490784092-3799676256-1862781748@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 14:37:36', 0, 0, 0, '14:40:52', NULL, NULL, NULL, NULL, '2020-05-28 14:40:52');
INSERT INTO public.acc VALUES (1193, 'INVITE', '3799684619-585043374', '', '491293627-3799684619-799157101@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 16:56:59', 0, 0, 0, '17:00:15', NULL, NULL, NULL, NULL, '2020-05-28 17:00:15');
INSERT INTO public.acc VALUES (1194, 'INVITE', '3799691424-877906047', '', '491739837-3799691424-110869363@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 18:50:24', 0, 0, 0, '18:53:39', NULL, NULL, NULL, NULL, '2020-05-28 18:53:39');
INSERT INTO public.acc VALUES (1195, 'INVITE', '3799691440-319957481', '', '491740237-3799691440-617041539@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 18:50:40', 0, 0, 0, '18:53:55', NULL, NULL, NULL, NULL, '2020-05-28 18:53:55');
INSERT INTO public.acc VALUES (1196, 'INVITE', '3799692421-176846425', '', '491802967-3799692421-2125105343@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 19:07:01', 0, 0, 0, '19:10:17', NULL, NULL, NULL, NULL, '2020-05-28 19:10:17');
INSERT INTO public.acc VALUES (1197, 'INVITE', '3799692464-1967619129', '', '491806662-3799692464-1458276446@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 19:07:44', 0, 0, 0, '19:10:59', NULL, NULL, NULL, NULL, '2020-05-28 19:10:59');
INSERT INTO public.acc VALUES (1198, 'INVITE', '3799699803-332111223', '', '492205977-3799699803-1504548412@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 21:10:03', 0, 0, 0, '21:13:19', NULL, NULL, NULL, NULL, '2020-05-28 21:13:19');
INSERT INTO public.acc VALUES (1199, 'INVITE', '3799700055-505445956', '', '492211627-3799700055-1725996557@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-28 21:14:15', 0, 0, 0, '21:17:31', NULL, NULL, NULL, NULL, '2020-05-28 21:17:31');
INSERT INTO public.acc VALUES (1200, 'INVITE', '3799746374-1726051307', '', '493303521-3799746374-126454308@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:06:14', 0, 0, 0, '10:09:30', NULL, NULL, NULL, NULL, '2020-05-29 10:09:30');
INSERT INTO public.acc VALUES (1201, 'INVITE', '3799746614-2129806128', '', '493313619-3799746614-506918572@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:10:14', 0, 0, 0, '10:13:30', NULL, NULL, NULL, NULL, '2020-05-29 10:13:30');
INSERT INTO public.acc VALUES (1202, 'INVITE', '3799746947-338099746', '', '493328030-3799746947-2060580395@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:15:47', 0, 0, 0, '10:19:03', NULL, NULL, NULL, NULL, '2020-05-29 10:19:03');
INSERT INTO public.acc VALUES (1203, 'INVITE', '3799747067-516752912', '', '493332941-3799747067-1229954695@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:17:48', 0, 0, 0, '10:21:03', NULL, NULL, NULL, NULL, '2020-05-29 10:21:03');
INSERT INTO public.acc VALUES (1204, 'INVITE', '3799747126-801654895', '', '493335344-3799747126-284635393@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:18:46', 0, 0, 0, '10:22:02', NULL, NULL, NULL, NULL, '2020-05-29 10:22:02');
INSERT INTO public.acc VALUES (1205, 'INVITE', '3799748517-1433233100', '', '493394590-3799748517-111317106@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:41:58', 0, 0, 0, '10:45:13', NULL, NULL, NULL, NULL, '2020-05-29 10:45:13');
INSERT INTO public.acc VALUES (1206, 'INVITE', '3799748568-291183725', '', '493396709-3799748568-8305524@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:42:48', 0, 0, 0, '10:46:04', NULL, NULL, NULL, NULL, '2020-05-29 10:46:04');
INSERT INTO public.acc VALUES (1207, 'INVITE', '3799748677-1992019204', '', '493401322-3799748677-1354171603@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:44:37', 0, 0, 0, '10:47:52', NULL, NULL, NULL, NULL, '2020-05-29 10:47:52');
INSERT INTO public.acc VALUES (1208, 'INVITE', '3799749335-233103502', '', '493429203-3799749335-213178198@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:55:35', 0, 0, 0, '10:58:51', NULL, NULL, NULL, NULL, '2020-05-29 10:58:51');
INSERT INTO public.acc VALUES (1209, 'INVITE', '3799749498-1700562839', '', '493435976-3799749498-1340395218@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:58:18', 0, 0, 0, '11:01:34', NULL, NULL, NULL, NULL, '2020-05-29 11:01:34');
INSERT INTO public.acc VALUES (1210, 'INVITE', '3799749569-1090456595', '', '493439067-3799749569-1471980559@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 10:59:29', 0, 0, 0, '11:02:45', NULL, NULL, NULL, NULL, '2020-05-29 11:02:45');
INSERT INTO public.acc VALUES (1211, 'INVITE', '3799750026-1808524863', '', '493458494-3799750026-805350972@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:07:06', 0, 0, 0, '11:10:22', NULL, NULL, NULL, NULL, '2020-05-29 11:10:22');
INSERT INTO public.acc VALUES (1212, 'INVITE', '3799750195-714525397', '', '493465766-3799750195-1776229234@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:09:55', 0, 0, 0, '11:13:11', NULL, NULL, NULL, NULL, '2020-05-29 11:13:11');
INSERT INTO public.acc VALUES (1213, 'INVITE', '3799750328-520255641', '', '493471354-3799750328-487495866@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:12:08', 0, 0, 0, '11:15:24', NULL, NULL, NULL, NULL, '2020-05-29 11:15:24');
INSERT INTO public.acc VALUES (1214, 'INVITE', '3799750446-483868895', '', '493476627-3799750446-1659148076@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:14:06', 0, 0, 0, '11:17:22', NULL, NULL, NULL, NULL, '2020-05-29 11:17:22');
INSERT INTO public.acc VALUES (1215, 'INVITE', '3799750784-493360748', '', '493491097-3799750784-1382234554@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:19:44', 0, 0, 0, '11:23:00', NULL, NULL, NULL, NULL, '2020-05-29 11:23:00');
INSERT INTO public.acc VALUES (1216, 'INVITE', '3799751003-1785510074', '', '493500400-3799751003-761987839@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:23:23', 0, 0, 0, '11:26:39', NULL, NULL, NULL, NULL, '2020-05-29 11:26:39');
INSERT INTO public.acc VALUES (1217, 'INVITE', '3799751151-1815924812', '', '493506613-3799751151-1220669583@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:25:51', 0, 0, 0, '11:29:07', NULL, NULL, NULL, NULL, '2020-05-29 11:29:07');
INSERT INTO public.acc VALUES (1218, 'INVITE', '3799752007-10813191', '', '493542453-3799752007-1751749571@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:40:07', 0, 0, 0, '11:43:23', NULL, NULL, NULL, NULL, '2020-05-29 11:43:23');
INSERT INTO public.acc VALUES (1219, 'INVITE', '3799752198-1114583865', '', '493550566-3799752198-950537856@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:43:18', 0, 0, 0, '11:46:34', NULL, NULL, NULL, NULL, '2020-05-29 11:46:34');
INSERT INTO public.acc VALUES (1220, 'INVITE', '3799752550-1474873785', '', '493565520-3799752550-1127057936@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:49:10', 0, 0, 0, '11:52:26', NULL, NULL, NULL, NULL, '2020-05-29 11:52:26');
INSERT INTO public.acc VALUES (1221, 'INVITE', '3799752705-1196197695', '', '493572196-3799752705-248230091@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:51:45', 0, 0, 0, '11:55:01', NULL, NULL, NULL, NULL, '2020-05-29 11:55:01');
INSERT INTO public.acc VALUES (1222, 'INVITE', '3799753013-998114360', '', '493584999-3799753013-955843781@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 11:56:54', 0, 0, 0, '12:00:09', NULL, NULL, NULL, NULL, '2020-05-29 12:00:09');
INSERT INTO public.acc VALUES (1223, 'INVITE', '3799753232-531017971', '', '493594048-3799753232-1574164832@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 12:00:32', 0, 0, 0, '12:03:48', NULL, NULL, NULL, NULL, '2020-05-29 12:03:48');
INSERT INTO public.acc VALUES (1224, 'INVITE', '3799762533-946904650', '', '493974534-3799762533-1745757859@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 14:35:33', 0, 0, 0, '14:38:49', NULL, NULL, NULL, NULL, '2020-05-29 14:38:49');
INSERT INTO public.acc VALUES (1225, 'INVITE', '3799762713-787851201', '', '493981723-3799762713-1955553784@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 14:38:33', 0, 0, 0, '14:41:49', NULL, NULL, NULL, NULL, '2020-05-29 14:41:49');
INSERT INTO public.acc VALUES (1226, 'INVITE', '3799762803-2044213291', '', '493985407-3799762803-717040448@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 14:40:03', 0, 0, 0, '14:43:19', NULL, NULL, NULL, NULL, '2020-05-29 14:43:19');
INSERT INTO public.acc VALUES (1227, 'INVITE', '3799762871-68810958', '', '493988210-3799762871-1410291928@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 14:41:11', 0, 0, 0, '14:44:27', NULL, NULL, NULL, NULL, '2020-05-29 14:44:27');
INSERT INTO public.acc VALUES (1228, 'INVITE', '3799763319-1313346124', '', '494006213-3799763319-681965868@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 14:48:39', 0, 0, 0, '14:51:55', NULL, NULL, NULL, NULL, '2020-05-29 14:51:55');
INSERT INTO public.acc VALUES (1229, 'INVITE', '3799763738-838757537', '', '494023996-3799763738-78188199@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 14:55:38', 0, 0, 0, '14:58:54', NULL, NULL, NULL, NULL, '2020-05-29 14:58:54');
INSERT INTO public.acc VALUES (1230, 'INVITE', '3799763928-778336152', '', '494031922-3799763928-105470727@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 14:58:48', 0, 0, 0, '15:02:04', NULL, NULL, NULL, NULL, '2020-05-29 15:02:04');
INSERT INTO public.acc VALUES (1231, 'INVITE', '3799766297-180697430', '', '494128224-3799766297-31582019@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 15:38:17', 0, 0, 0, '15:41:33', NULL, NULL, NULL, NULL, '2020-05-29 15:41:33');
INSERT INTO public.acc VALUES (1232, 'INVITE', '3799766357-1627892237', '', '494130662-3799766357-693544514@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 15:39:17', 0, 0, 0, '15:42:33', NULL, NULL, NULL, NULL, '2020-05-29 15:42:33');
INSERT INTO public.acc VALUES (1233, 'INVITE', '3799766516-1709392014', '', '494137119-3799766516-382057250@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 15:41:56', 0, 0, 0, '15:45:12', NULL, NULL, NULL, NULL, '2020-05-29 15:45:12');
INSERT INTO public.acc VALUES (1234, 'INVITE', '3799770565-1484755699', '', '494297468-3799770565-1357199129@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 16:49:25', 0, 0, 0, '16:52:41', NULL, NULL, NULL, NULL, '2020-05-29 16:52:41');
INSERT INTO public.acc VALUES (1235, 'INVITE', '3799770668-590525647', '', '494301531-3799770668-216678494@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 16:51:08', 0, 0, 0, '16:54:24', NULL, NULL, NULL, NULL, '2020-05-29 16:54:24');
INSERT INTO public.acc VALUES (1236, 'INVITE', '3799770760-871879873', '', '494305254-3799770760-1471667209@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 16:52:40', 0, 0, 0, '16:55:56', NULL, NULL, NULL, NULL, '2020-05-29 16:55:56');
INSERT INTO public.acc VALUES (1237, 'INVITE', '3799770846-590109810', '', '494308619-3799770846-2083022866@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 16:54:07', 0, 0, 0, '16:57:23', NULL, NULL, NULL, NULL, '2020-05-29 16:57:23');
INSERT INTO public.acc VALUES (1238, 'INVITE', '3799770918-1200727947', '', '494311346-3799770918-1045145190@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 16:55:18', 0, 0, 0, '16:58:34', NULL, NULL, NULL, NULL, '2020-05-29 16:58:34');
INSERT INTO public.acc VALUES (1239, 'INVITE', '3799771171-1606450739', '', '494320765-3799771171-408306082@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 16:59:31', 0, 0, 0, '17:02:47', NULL, NULL, NULL, NULL, '2020-05-29 17:02:47');
INSERT INTO public.acc VALUES (1240, 'INVITE', '3799771270-797358056', '', '494324588-3799771270-1298924709@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 17:01:10', 0, 0, 0, '17:04:26', NULL, NULL, NULL, NULL, '2020-05-29 17:04:26');
INSERT INTO public.acc VALUES (1241, 'INVITE', '3799771395-745986802', '', '494329245-3799771395-1779140161@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 17:03:15', 0, 0, 0, '17:06:31', NULL, NULL, NULL, NULL, '2020-05-29 17:06:31');
INSERT INTO public.acc VALUES (1242, 'INVITE', '3799771498-672176615', '', '494333085-3799771498-1542594691@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 17:04:58', 0, 0, 0, '17:08:14', NULL, NULL, NULL, NULL, '2020-05-29 17:08:14');
INSERT INTO public.acc VALUES (1243, 'INVITE', '3799771567-209072349', 'ZSNSt1rH7t3pH', '494335619-3799771567-1995806480@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 17:06:07', 19, 18413, 0, '2020-05-29 17:06:07', '61981203815', '9055', '8392', '10.123.125.11', '2020-05-29 17:09:42');
INSERT INTO public.acc VALUES (1244, 'INVITE', '3799771676-1767573663', '', '494339639-3799771676-440238899@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 17:07:56', 0, 0, 0, '17:11:12', NULL, NULL, NULL, NULL, '2020-05-29 17:11:12');
INSERT INTO public.acc VALUES (1245, 'INVITE', '3799771849-1673020981', '', '494346392-3799771849-1437571003@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-29 17:10:49', 0, 0, 0, '17:14:05', NULL, NULL, NULL, NULL, '2020-05-29 17:14:05');
INSERT INTO public.acc VALUES (1246, 'INVITE', '3799832086-1099128877', '', '495941416-3799832086-600565106@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-30 09:54:46', 0, 0, 0, '09:58:02', NULL, NULL, NULL, NULL, '2020-05-30 09:58:02');
INSERT INTO public.acc VALUES (1247, 'INVITE', '3799832211-204843501', '', '495948531-3799832211-1303720941@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-30 09:56:51', 0, 0, 0, '10:00:08', NULL, NULL, NULL, NULL, '2020-05-30 10:00:08');
INSERT INTO public.acc VALUES (1248, 'INVITE', '3799832374-1686346256', '', '495958005-3799832374-474217307@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-30 09:59:34', 0, 0, 0, '10:02:51', NULL, NULL, NULL, NULL, '2020-05-30 10:02:51');
INSERT INTO public.acc VALUES (1249, 'INVITE', '3799869761-223075331', '', '497455853-3799869761-626057915@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-30 20:22:41', 0, 0, 0, '20:25:58', NULL, NULL, NULL, NULL, '2020-05-30 20:25:58');
INSERT INTO public.acc VALUES (1250, 'INVITE', '3799869826-1646945907', '', '497457196-3799869826-893950094@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-30 20:23:46', 0, 0, 0, '20:27:03', NULL, NULL, NULL, NULL, '2020-05-30 20:27:03');
INSERT INTO public.acc VALUES (1251, 'INVITE', '3799872797-431715844', '', '497519555-3799872797-1782504102@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-30 21:13:17', 0, 0, 0, '21:16:34', NULL, NULL, NULL, NULL, '2020-05-30 21:16:34');
INSERT INTO public.acc VALUES (1252, 'INVITE', '3799934915-656667446', '', '498780224-3799934915-1461885732@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-31 14:28:35', 0, 0, 0, '14:31:52', NULL, NULL, NULL, NULL, '2020-05-31 14:31:52');
INSERT INTO public.acc VALUES (1253, 'INVITE', '3799935199-673724631', '', '498786277-3799935199-1664024499@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-05-31 14:33:19', 0, 0, 0, '14:36:36', NULL, NULL, NULL, NULL, '2020-05-31 14:36:36');
INSERT INTO public.acc VALUES (1254, 'INVITE', '3799989145-406666204', '', '499881556-3799989145-1521318279@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-01 05:32:25', 0, 0, 0, '05:35:43', NULL, NULL, NULL, NULL, '2020-06-01 05:35:43');
INSERT INTO public.acc VALUES (1255, 'INVITE', '3800000036-1998298895', '', '500211440-3800000036-526843426@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-01 08:33:56', 0, 0, 0, '08:37:14', NULL, NULL, NULL, NULL, '2020-06-01 08:37:14');
INSERT INTO public.acc VALUES (1256, 'INVITE', '3800002660-1643240342', '', '500440425-3800002660-912327662@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-01 09:17:40', 0, 0, 0, '09:20:58', NULL, NULL, NULL, NULL, '2020-06-01 09:20:58');
INSERT INTO public.acc VALUES (1257, 'INVITE', '3800009598-1548528591', '', '501078543-3800009598-132017268@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-01 11:13:18', 0, 0, 0, '11:16:36', NULL, NULL, NULL, NULL, '2020-06-01 11:16:36');
INSERT INTO public.acc VALUES (1258, 'INVITE', '3800009906-288751382', '', '501103587-3800009906-1334678535@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-01 11:18:26', 0, 0, 0, '11:21:44', NULL, NULL, NULL, NULL, '2020-06-01 11:21:44');
INSERT INTO public.acc VALUES (1259, 'INVITE', '3800019797-1887963012', '', '501854007-3800019797-275330076@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-01 14:03:17', 0, 0, 0, '14:06:35', NULL, NULL, NULL, NULL, '2020-06-01 14:06:35');
INSERT INTO public.acc VALUES (1260, 'INVITE', '3800019871-325618614', '', '501858901-3800019871-1008114140@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-01 14:04:31', 0, 0, 0, '14:07:49', NULL, NULL, NULL, NULL, '2020-06-01 14:07:49');
INSERT INTO public.acc VALUES (1261, 'INVITE', '3800046297-176968277', '', '503368001-3800046297-1867112197@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-01 21:24:57', 0, 0, 0, '21:28:15', NULL, NULL, NULL, NULL, '2020-06-01 21:28:15');
INSERT INTO public.acc VALUES (1262, 'INVITE', '3800056988-667276447', '', '503589799-3800056988-1309074260@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 00:23:08', 0, 0, 0, '00:26:26', NULL, NULL, NULL, NULL, '2020-06-02 00:26:26');
INSERT INTO public.acc VALUES (1263, 'INVITE', '3800090514-1694576670', '', '504546486-3800090514-1556926376@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 09:41:54', 0, 0, 0, '09:45:13', NULL, NULL, NULL, NULL, '2020-06-02 09:45:13');
INSERT INTO public.acc VALUES (1264, 'INVITE', '3800090559-206147180', '', '504550314-3800090559-943748771@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 09:42:39', 0, 0, 0, '09:45:58', NULL, NULL, NULL, NULL, '2020-06-02 09:45:58');
INSERT INTO public.acc VALUES (1265, 'INVITE', '3800093547-938833255', '', '504798707-3800093547-451573703@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 10:32:27', 0, 0, 0, '10:35:45', NULL, NULL, NULL, NULL, '2020-06-02 10:35:45');
INSERT INTO public.acc VALUES (1266, 'INVITE', '3800095786-285099772', '', '504979140-3800095786-1502970302@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 11:09:46', 0, 0, 0, '11:13:05', NULL, NULL, NULL, NULL, '2020-06-02 11:13:05');
INSERT INTO public.acc VALUES (1267, 'INVITE', '3800095965-2110529718', '', '504992775-3800095965-331636367@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 11:12:45', 0, 0, 0, '11:16:03', NULL, NULL, NULL, NULL, '2020-06-02 11:16:03');
INSERT INTO public.acc VALUES (1268, 'INVITE', '3800096326-1421017891', '', '505020989-3800096326-1105538771@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 11:18:46', 0, 0, 0, '11:22:05', NULL, NULL, NULL, NULL, '2020-06-02 11:22:05');
INSERT INTO public.acc VALUES (1269, 'INVITE', '3800097080-1055628861', '', '505078463-3800097080-958413112@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 11:31:20', 0, 0, 0, '11:34:38', NULL, NULL, NULL, NULL, '2020-06-02 11:34:38');
INSERT INTO public.acc VALUES (1270, 'INVITE', '3800097344-956154944', '', '505097229-3800097344-1737135342@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 11:35:44', 0, 0, 0, '11:39:03', NULL, NULL, NULL, NULL, '2020-06-02 11:39:03');
INSERT INTO public.acc VALUES (1271, 'INVITE', '3800097539-772202470', '', '505112140-3800097539-1002294346@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 11:38:59', 0, 0, 0, '11:42:17', NULL, NULL, NULL, NULL, '2020-06-02 11:42:17');
INSERT INTO public.acc VALUES (1272, 'INVITE', '3800098120-413613639', '', '505156098-3800098120-1240229868@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 11:48:40', 0, 0, 0, '11:51:59', NULL, NULL, NULL, NULL, '2020-06-02 11:51:59');
INSERT INTO public.acc VALUES (1273, 'INVITE', '3800098180-1526875076', '', '505160654-3800098180-1175270929@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 11:49:40', 0, 0, 0, '11:52:59', NULL, NULL, NULL, NULL, '2020-06-02 11:52:59');
INSERT INTO public.acc VALUES (1274, 'INVITE', '3800099185-1781938413', '', '505235319-3800099185-571704125@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 12:06:25', 0, 0, 0, '12:09:44', NULL, NULL, NULL, NULL, '2020-06-02 12:09:44');
INSERT INTO public.acc VALUES (1275, 'INVITE', '3800100171-1052315060', '', '505307218-3800100171-331759269@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 12:22:51', 0, 0, 0, '12:26:10', NULL, NULL, NULL, NULL, '2020-06-02 12:26:10');
INSERT INTO public.acc VALUES (1276, 'INVITE', '3800102668-743550501', '', '505483217-3800102668-1299799158@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 13:04:28', 0, 0, 0, '13:07:46', NULL, NULL, NULL, NULL, '2020-06-02 13:07:46');
INSERT INTO public.acc VALUES (1277, 'INVITE', '3800102792-657219057', '', '505491538-3800102792-1560076130@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 13:06:32', 0, 0, 0, '13:09:51', NULL, NULL, NULL, NULL, '2020-06-02 13:09:51');
INSERT INTO public.acc VALUES (1278, 'INVITE', '3800104820-348758246', '', '505644130-3800104820-1007963214@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 13:40:20', 0, 0, 0, '13:43:38', NULL, NULL, NULL, NULL, '2020-06-02 13:43:38');
INSERT INTO public.acc VALUES (1279, 'INVITE', '3800105042-1666623572', '', '505660991-3800105042-338240232@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 13:44:02', 0, 0, 0, '13:47:20', NULL, NULL, NULL, NULL, '2020-06-02 13:47:20');
INSERT INTO public.acc VALUES (1280, 'INVITE', '3800105690-440765420', '', '505711170-3800105690-354008831@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 13:54:50', 0, 0, 0, '13:58:09', NULL, NULL, NULL, NULL, '2020-06-02 13:58:09');
INSERT INTO public.acc VALUES (1281, 'INVITE', '3800106444-1631146604', '', '505768578-3800106444-2078554522@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 14:07:24', 0, 0, 0, '14:10:42', NULL, NULL, NULL, NULL, '2020-06-02 14:10:42');
INSERT INTO public.acc VALUES (1282, 'INVITE', '3800106488-1380411257', '', '505771658-3800106488-12960676@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 14:08:08', 0, 0, 0, '14:11:27', NULL, NULL, NULL, NULL, '2020-06-02 14:11:27');
INSERT INTO public.acc VALUES (1283, 'INVITE', '3800106592-400694126', '', '505778835-3800106592-55557324@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 14:09:52', 0, 0, 0, '14:13:10', NULL, NULL, NULL, NULL, '2020-06-02 14:13:10');
INSERT INTO public.acc VALUES (1284, 'INVITE', '3800106750-1726833843', '', '505790196-3800106750-1835049045@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 14:12:30', 0, 0, 0, '14:15:49', NULL, NULL, NULL, NULL, '2020-06-02 14:15:49');
INSERT INTO public.acc VALUES (1285, 'INVITE', '3800106865-377931519', '', '505799066-3800106865-1705428196@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 14:14:25', 0, 0, 0, '14:17:44', NULL, NULL, NULL, NULL, '2020-06-02 14:17:44');
INSERT INTO public.acc VALUES (1286, 'INVITE', '3800110586-2017827621', '', '506072869-3800110586-1672690819@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 15:16:26', 0, 0, 0, '15:19:44', NULL, NULL, NULL, NULL, '2020-06-02 15:19:44');
INSERT INTO public.acc VALUES (1287, 'INVITE', '3800110653-2122232028', '', '506078005-3800110653-196378029@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 15:17:33', 0, 0, 0, '15:20:52', NULL, NULL, NULL, NULL, '2020-06-02 15:20:52');
INSERT INTO public.acc VALUES (1288, 'INVITE', '3800110873-5777221', '', '506093249-3800110873-742270585@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-02 15:21:13', 0, 0, 0, '15:24:31', NULL, NULL, NULL, NULL, '2020-06-02 15:24:31');
INSERT INTO public.acc VALUES (1289, 'INVITE', '3800286817-132039323', '', '512748438-3800286817-1253159768@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-04 16:13:37', 0, 0, 0, '16:16:57', NULL, NULL, NULL, NULL, '2020-06-04 16:16:57');
INSERT INTO public.acc VALUES (1290, 'INVITE', '3800286880-1547785097', '', '512751707-3800286880-901676734@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-04 16:14:40', 0, 0, 0, '16:18:00', NULL, NULL, NULL, NULL, '2020-06-04 16:18:00');
INSERT INTO public.acc VALUES (1291, 'INVITE', '3800348905-647253028', '', '514439340-3800348905-1852027969@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:28:25', 0, 0, 0, '09:31:46', NULL, NULL, NULL, NULL, '2020-06-05 09:31:46');
INSERT INTO public.acc VALUES (1292, 'INVITE', '3800349000-11748520', '', '514442249-3800349000-1942237920@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:30:00', 0, 0, 0, '09:33:21', NULL, NULL, NULL, NULL, '2020-06-05 09:33:21');
INSERT INTO public.acc VALUES (1293, 'INVITE', '3800349260-1017318232', '', '514450277-3800349260-2048314788@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:34:20', 0, 0, 0, '09:37:40', NULL, NULL, NULL, NULL, '2020-06-05 09:37:40');
INSERT INTO public.acc VALUES (1294, 'INVITE', '3800349371-805414545', '', '514453925-3800349371-1256713031@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:36:11', 0, 0, 0, '09:39:32', NULL, NULL, NULL, NULL, '2020-06-05 09:39:32');
INSERT INTO public.acc VALUES (1295, 'INVITE', '3800349534-808477910', '', '514459254-3800349534-751379002@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:38:54', 0, 0, 0, '09:42:15', NULL, NULL, NULL, NULL, '2020-06-05 09:42:15');
INSERT INTO public.acc VALUES (1296, 'INVITE', '3800349920-2120734188', '', '514471542-3800349920-852815008@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:45:20', 0, 0, 0, '09:48:40', NULL, NULL, NULL, NULL, '2020-06-05 09:48:40');
INSERT INTO public.acc VALUES (1297, 'INVITE', '3800350146-962528547', '', '514479079-3800350146-372109169@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:49:06', 0, 0, 0, '09:52:27', NULL, NULL, NULL, NULL, '2020-06-05 09:52:27');
INSERT INTO public.acc VALUES (1298, 'INVITE', '3800350490-1717304847', '', '514491042-3800350490-1584911402@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:54:50', 0, 0, 0, '09:58:10', NULL, NULL, NULL, NULL, '2020-06-05 09:58:10');
INSERT INTO public.acc VALUES (1299, 'INVITE', '3800350685-1333049179', '', '514497713-3800350685-88421580@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 09:58:05', 0, 0, 0, '10:01:26', NULL, NULL, NULL, NULL, '2020-06-05 10:01:26');
INSERT INTO public.acc VALUES (1300, 'INVITE', '3800371526-171023096', '', '515208644-3800371526-931754347@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 15:45:26', 0, 0, 0, '15:48:47', NULL, NULL, NULL, NULL, '2020-06-05 15:48:47');
INSERT INTO public.acc VALUES (1301, 'INVITE', '3800371643-808747772', '', '515212305-3800371643-1765500414@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 15:47:23', 0, 0, 0, '15:50:44', NULL, NULL, NULL, NULL, '2020-06-05 15:50:44');
INSERT INTO public.acc VALUES (1302, 'INVITE', '3800372854-1902420984', '', '515251029-3800372854-469085426@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 16:07:34', 0, 0, 0, '16:10:55', NULL, NULL, NULL, NULL, '2020-06-05 16:10:55');
INSERT INTO public.acc VALUES (1303, 'INVITE', '3800373081-428347349', '', '515258097-3800373081-75694625@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 16:11:21', 0, 0, 0, '16:14:41', NULL, NULL, NULL, NULL, '2020-06-05 16:14:41');
INSERT INTO public.acc VALUES (1304, 'INVITE', '3800373709-265617297', '', '515277716-3800373709-693623178@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 16:21:49', 0, 0, 0, '16:25:10', NULL, NULL, NULL, NULL, '2020-06-05 16:25:10');
INSERT INTO public.acc VALUES (1305, 'INVITE', '3800373931-1972725892', '', '515284592-3800373931-1729016177@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 16:25:32', 0, 0, 0, '16:28:52', NULL, NULL, NULL, NULL, '2020-06-05 16:28:52');
INSERT INTO public.acc VALUES (1306, 'INVITE', '3800375528-666507982', '', '515333245-3800375528-1463365285@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 16:52:08', 0, 0, 0, '16:55:29', NULL, NULL, NULL, NULL, '2020-06-05 16:55:29');
INSERT INTO public.acc VALUES (1307, 'INVITE', '3800375690-400525101', '', '515338119-3800375690-958667395@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 16:54:50', 0, 0, 0, '16:58:11', NULL, NULL, NULL, NULL, '2020-06-05 16:58:11');
INSERT INTO public.acc VALUES (1308, 'INVITE', '3800375792-919286847', '', '515341134-3800375792-1668876823@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 16:56:32', 0, 0, 0, '16:59:52', NULL, NULL, NULL, NULL, '2020-06-05 16:59:52');
INSERT INTO public.acc VALUES (1309, 'INVITE', '3800375928-931978306', '', '515345347-3800375928-359330494@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 16:58:48', 0, 0, 0, '17:02:09', NULL, NULL, NULL, NULL, '2020-06-05 17:02:09');
INSERT INTO public.acc VALUES (1310, 'INVITE', '3800376061-467332578', '', '515349320-3800376061-1011915668@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:01:01', 0, 0, 0, '17:04:22', NULL, NULL, NULL, NULL, '2020-06-05 17:04:22');
INSERT INTO public.acc VALUES (1311, 'INVITE', '3800376184-3370053', '', '515352933-3800376184-996509865@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:03:04', 0, 0, 0, '17:06:25', NULL, NULL, NULL, NULL, '2020-06-05 17:06:25');
INSERT INTO public.acc VALUES (1312, 'INVITE', '3800376274-541838429', '', '515355552-3800376274-1836998378@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:04:34', 0, 0, 0, '17:07:54', NULL, NULL, NULL, NULL, '2020-06-05 17:07:54');
INSERT INTO public.acc VALUES (1313, 'INVITE', '3800376460-1618028885', '', '515361094-3800376460-2136157632@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:07:40', 0, 0, 0, '17:11:01', NULL, NULL, NULL, NULL, '2020-06-05 17:11:01');
INSERT INTO public.acc VALUES (1314, 'INVITE', '3800376823-267976846', '', '515372005-3800376823-370773278@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:13:43', 0, 0, 0, '17:17:04', NULL, NULL, NULL, NULL, '2020-06-05 17:17:04');
INSERT INTO public.acc VALUES (1315, 'INVITE', '3800377123-1804855867', '', '515380865-3800377123-1665047746@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:18:43', 0, 0, 0, '17:22:04', NULL, NULL, NULL, NULL, '2020-06-05 17:22:04');
INSERT INTO public.acc VALUES (1316, 'INVITE', '3800377303-1224205177', '', '515386222-3800377303-252786119@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:21:43', 0, 0, 0, '17:25:04', NULL, NULL, NULL, NULL, '2020-06-05 17:25:04');
INSERT INTO public.acc VALUES (1317, 'INVITE', '3800377501-2141257638', '', '515392049-3800377501-539142490@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:25:01', 0, 0, 0, '17:28:21', NULL, NULL, NULL, NULL, '2020-06-05 17:28:21');
INSERT INTO public.acc VALUES (1318, 'INVITE', '3800377632-1298589283', '', '515396039-3800377632-1762821437@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:27:12', 0, 0, 0, '17:30:33', NULL, NULL, NULL, NULL, '2020-06-05 17:30:33');
INSERT INTO public.acc VALUES (1319, 'INVITE', '3800378126-338037463', '', '515410596-3800378126-1830849274@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:35:27', 0, 0, 0, '17:38:47', NULL, NULL, NULL, NULL, '2020-06-05 17:38:47');
INSERT INTO public.acc VALUES (1320, 'INVITE', '3800378468-1611206611', '', '515420254-3800378468-1772370051@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:41:08', 0, 0, 0, '17:44:29', NULL, NULL, NULL, NULL, '2020-06-05 17:44:29');
INSERT INTO public.acc VALUES (1321, 'INVITE', '3800378561-1959420963', '', '515422984-3800378561-2068685765@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:42:41', 0, 0, 0, '17:46:02', NULL, NULL, NULL, NULL, '2020-06-05 17:46:02');
INSERT INTO public.acc VALUES (1322, 'INVITE', '3800378936-1454376403', '', '515433659-3800378936-1480931991@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:48:56', 0, 0, 0, '17:52:17', NULL, NULL, NULL, NULL, '2020-06-05 17:52:17');
INSERT INTO public.acc VALUES (1323, 'INVITE', '3800379166-152254775', '', '515440138-3800379166-1479752477@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:52:46', 0, 0, 0, '17:56:07', NULL, NULL, NULL, NULL, '2020-06-05 17:56:07');
INSERT INTO public.acc VALUES (1324, 'INVITE', '3800379369-1153675275', '', '515445767-3800379369-363449279@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:56:09', 0, 0, 0, '17:59:30', NULL, NULL, NULL, NULL, '2020-06-05 17:59:30');
INSERT INTO public.acc VALUES (1325, 'INVITE', '3800379491-184797277', '', '515449211-3800379491-453957418@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 17:58:11', 0, 0, 0, '18:01:32', NULL, NULL, NULL, NULL, '2020-06-05 18:01:32');
INSERT INTO public.acc VALUES (1326, 'INVITE', '3800379658-754141888', '', '515453859-3800379658-1713735498@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 18:00:58', 0, 0, 0, '18:04:19', NULL, NULL, NULL, NULL, '2020-06-05 18:04:19');
INSERT INTO public.acc VALUES (1327, 'INVITE', '3800379904-1255465210', '', '515460537-3800379904-1886907158@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-05 18:05:04', 0, 0, 0, '18:08:25', NULL, NULL, NULL, NULL, '2020-06-05 18:08:25');
INSERT INTO public.acc VALUES (1328, 'INVITE', '3800445189-737520954', '', '517372944-3800445189-2012069393@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-06 12:13:09', 0, 0, 0, '12:16:30', NULL, NULL, NULL, NULL, '2020-06-06 12:16:30');
INSERT INTO public.acc VALUES (1329, 'INVITE', '3800445424-1145824259', '', '517385291-3800445424-1398160165@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-06 12:17:04', 0, 0, 0, '12:20:25', NULL, NULL, NULL, NULL, '2020-06-06 12:20:25');
INSERT INTO public.acc VALUES (1330, 'INVITE', '3800445659-1147096064', '', '517398066-3800445659-1299899545@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-06 12:20:59', 0, 0, 0, '12:24:21', NULL, NULL, NULL, NULL, '2020-06-06 12:24:21');
INSERT INTO public.acc VALUES (1331, 'INVITE', '3800445806-764973127', '', '517406426-3800445806-1204283228@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-06 12:23:26', 0, 0, 0, '12:26:47', NULL, NULL, NULL, NULL, '2020-06-06 12:26:47');
INSERT INTO public.acc VALUES (1332, 'INVITE', '3800446116-423787381', '', '517424197-3800446116-1493007140@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-06 12:28:36', 0, 0, 0, '12:31:57', NULL, NULL, NULL, NULL, '2020-06-06 12:31:57');
INSERT INTO public.acc VALUES (1333, 'INVITE', '3800650379-1284472412', '', '523976638-3800650379-879817756@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-08 21:12:59', 0, 0, 0, '21:16:22', NULL, NULL, NULL, NULL, '2020-06-08 21:16:22');
INSERT INTO public.acc VALUES (1334, 'INVITE', '3800696018-1641874096', '', '525027988-3800696018-1060499866@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 09:53:38', 0, 0, 0, '09:57:01', NULL, NULL, NULL, NULL, '2020-06-09 09:57:01');
INSERT INTO public.acc VALUES (1335, 'INVITE', '3800708375-1087037453', '', '525981961-3800708375-364851191@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:19:35', 0, 0, 0, '13:22:58', NULL, NULL, NULL, NULL, '2020-06-09 13:22:58');
INSERT INTO public.acc VALUES (1336, 'INVITE', '3800708589-1250639712', '', '525997167-3800708589-549485958@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:23:09', 0, 0, 0, '13:26:33', NULL, NULL, NULL, NULL, '2020-06-09 13:26:33');
INSERT INTO public.acc VALUES (1337, 'INVITE', '3800708740-823824404', '', '526007858-3800708740-1825063057@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:25:40', 0, 0, 0, '13:29:04', NULL, NULL, NULL, NULL, '2020-06-09 13:29:04');
INSERT INTO public.acc VALUES (1338, 'INVITE', '3800708828-42201775', '', '526013717-3800708828-1521232810@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:27:08', 0, 0, 0, '13:30:32', NULL, NULL, NULL, NULL, '2020-06-09 13:30:32');
INSERT INTO public.acc VALUES (1339, 'INVITE', '3800709033-797204917', '', '526028072-3800709033-391603955@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:30:33', 0, 0, 0, '13:33:56', NULL, NULL, NULL, NULL, '2020-06-09 13:33:56');
INSERT INTO public.acc VALUES (1340, 'INVITE', '3800709200-911822008', '', '526039768-3800709200-955100586@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:33:20', 0, 0, 0, '13:36:44', NULL, NULL, NULL, NULL, '2020-06-09 13:36:44');
INSERT INTO public.acc VALUES (1341, 'INVITE', '3800709329-1428503310', '', '526048728-3800709329-1946632056@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:35:29', 0, 0, 0, '13:38:52', NULL, NULL, NULL, NULL, '2020-06-09 13:38:52');
INSERT INTO public.acc VALUES (1342, 'INVITE', '3800709513-119619250', '', '526061742-3800709513-2059415940@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:38:33', 0, 0, 0, '13:41:57', NULL, NULL, NULL, NULL, '2020-06-09 13:41:57');
INSERT INTO public.acc VALUES (1343, 'INVITE', '3800709582-1586059472', '', '526066847-3800709582-169811315@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:39:42', 0, 0, 0, '13:43:06', NULL, NULL, NULL, NULL, '2020-06-09 13:43:06');
INSERT INTO public.acc VALUES (1344, 'INVITE', '3800709778-1028765874', '', '526080614-3800709778-420939341@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:42:58', 0, 0, 0, '13:46:21', NULL, NULL, NULL, NULL, '2020-06-09 13:46:21');
INSERT INTO public.acc VALUES (1345, 'INVITE', '3800709875-1471363690', '', '526087666-3800709875-600424388@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:44:35', 0, 0, 0, '13:47:58', NULL, NULL, NULL, NULL, '2020-06-09 13:47:58');
INSERT INTO public.acc VALUES (1346, 'INVITE', '3800710191-590219092', '', '526110547-3800710191-1757820430@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:49:51', 0, 0, 0, '13:53:14', NULL, NULL, NULL, NULL, '2020-06-09 13:53:14');
INSERT INTO public.acc VALUES (1347, 'INVITE', '3800710294-1363717622', '', '526117665-3800710294-1860710567@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:51:34', 0, 0, 0, '13:54:57', NULL, NULL, NULL, NULL, '2020-06-09 13:54:57');
INSERT INTO public.acc VALUES (1348, 'INVITE', '3800710568-1442450481', '', '526136352-3800710568-425497861@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 13:56:08', 0, 0, 0, '13:59:31', NULL, NULL, NULL, NULL, '2020-06-09 13:59:31');
INSERT INTO public.acc VALUES (1349, 'INVITE', '3800710804-603201466', '', '526152707-3800710804-1186266836@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:00:04', 0, 0, 0, '14:03:28', NULL, NULL, NULL, NULL, '2020-06-09 14:03:28');
INSERT INTO public.acc VALUES (1350, 'INVITE', '3800710983-2026923083', '', '526164734-3800710983-1153987874@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:03:03', 0, 0, 0, '14:06:27', NULL, NULL, NULL, NULL, '2020-06-09 14:06:27');
INSERT INTO public.acc VALUES (1351, 'INVITE', '3800711074-465311816', '', '526170875-3800711074-898737490@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:04:34', 0, 0, 0, '14:07:58', NULL, NULL, NULL, NULL, '2020-06-09 14:07:58');
INSERT INTO public.acc VALUES (1352, 'INVITE', '3800711199-1845135637', '', '526179110-3800711199-853367212@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:06:39', 0, 0, 0, '14:10:02', NULL, NULL, NULL, NULL, '2020-06-09 14:10:02');
INSERT INTO public.acc VALUES (1353, 'INVITE', '3800711299-921650815', '', '526185801-3800711299-38358717@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:08:19', 0, 0, 0, '14:11:42', NULL, NULL, NULL, NULL, '2020-06-09 14:11:42');
INSERT INTO public.acc VALUES (1354, 'INVITE', '3800711527-1690077938', '', '526201941-3800711527-1200821456@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:12:07', 0, 0, 0, '14:15:30', NULL, NULL, NULL, NULL, '2020-06-09 14:15:30');
INSERT INTO public.acc VALUES (1355, 'INVITE', '3800711712-240176056', '', '526214506-3800711712-250954961@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:15:12', 0, 0, 0, '14:18:35', NULL, NULL, NULL, NULL, '2020-06-09 14:18:35');
INSERT INTO public.acc VALUES (1356, 'INVITE', '3800711783-1827565399', '', '526219365-3800711783-1754588563@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:16:23', 0, 0, 0, '14:19:47', NULL, NULL, NULL, NULL, '2020-06-09 14:19:47');
INSERT INTO public.acc VALUES (1357, 'INVITE', '3800711793-1339351663', '', '526220089-3800711793-756448206@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:16:33', 0, 0, 0, '14:19:56', NULL, NULL, NULL, NULL, '2020-06-09 14:19:56');
INSERT INTO public.acc VALUES (1358, 'INVITE', '3800711927-1885926653', '', '526229236-3800711927-876386662@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:18:47', 0, 0, 0, '14:22:11', NULL, NULL, NULL, NULL, '2020-06-09 14:22:11');
INSERT INTO public.acc VALUES (1359, 'INVITE', '3800712030-183991543', '', '526236378-3800712030-1110037928@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:20:31', 0, 0, 0, '14:23:54', NULL, NULL, NULL, NULL, '2020-06-09 14:23:54');
INSERT INTO public.acc VALUES (1360, 'INVITE', '3800712574-538577785', '', '526274006-3800712574-587376378@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:29:34', 0, 0, 0, '14:32:58', NULL, NULL, NULL, NULL, '2020-06-09 14:32:58');
INSERT INTO public.acc VALUES (1361, 'INVITE', '3800712785-2098273800', '', '526289167-3800712785-309125828@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:33:05', 0, 0, 0, '14:36:28', NULL, NULL, NULL, NULL, '2020-06-09 14:36:28');
INSERT INTO public.acc VALUES (1362, 'INVITE', '3800713569-947218186', '', '526343733-3800713569-2092576519@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:46:09', 0, 0, 0, '14:49:33', NULL, NULL, NULL, NULL, '2020-06-09 14:49:33');
INSERT INTO public.acc VALUES (1363, 'INVITE', '3800713932-1024641187', '', '526368730-3800713932-347827590@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:52:12', 0, 0, 0, '14:55:36', NULL, NULL, NULL, NULL, '2020-06-09 14:55:36');
INSERT INTO public.acc VALUES (1364, 'INVITE', '3800713966-1138073950', '', '526371037-3800713966-1120988589@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:52:46', 0, 0, 0, '14:56:10', NULL, NULL, NULL, NULL, '2020-06-09 14:56:10');
INSERT INTO public.acc VALUES (1365, 'INVITE', '3800714156-643104780', '', '526384251-3800714156-96428620@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:55:56', 0, 0, 0, '14:59:20', NULL, NULL, NULL, NULL, '2020-06-09 14:59:20');
INSERT INTO public.acc VALUES (1366, 'INVITE', '3800714327-990467762', '', '526396062-3800714327-1350856948@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 14:58:47', 0, 0, 0, '15:02:10', NULL, NULL, NULL, NULL, '2020-06-09 15:02:10');
INSERT INTO public.acc VALUES (1367, 'INVITE', '3800714480-930326552', '', '526406934-3800714480-1824983539@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 15:01:20', 0, 0, 0, '15:04:43', NULL, NULL, NULL, NULL, '2020-06-09 15:04:43');
INSERT INTO public.acc VALUES (1368, 'INVITE', '3800714700-1569339699', '', '526422524-3800714700-426299059@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 15:05:00', 0, 0, 0, '15:08:23', NULL, NULL, NULL, NULL, '2020-06-09 15:08:23');
INSERT INTO public.acc VALUES (1369, 'INVITE', '3800714819-1572527761', '', '526431131-3800714819-357558868@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 15:06:59', 0, 0, 0, '15:10:22', NULL, NULL, NULL, NULL, '2020-06-09 15:10:22');
INSERT INTO public.acc VALUES (1370, 'INVITE', '3800715230-1168406504', '', '526459977-3800715230-265813614@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-09 15:13:50', 0, 0, 0, '15:17:14', NULL, NULL, NULL, NULL, '2020-06-09 15:17:14');
INSERT INTO public.acc VALUES (1371, 'INVITE', '3800783225-1786580330', '', '528887783-3800783225-1412530686@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 10:07:05', 0, 0, 0, '10:10:29', NULL, NULL, NULL, NULL, '2020-06-10 10:10:29');
INSERT INTO public.acc VALUES (1372, 'INVITE', '3800797806-1405145354', '', '529751871-3800797806-2096104132@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 14:10:06', 0, 0, 0, '14:13:30', NULL, NULL, NULL, NULL, '2020-06-10 14:13:30');
INSERT INTO public.acc VALUES (1373, 'INVITE', '3800815154-1994339859', '', '530651827-3800815154-1473328543@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 18:59:14', 0, 0, 0, '19:02:38', NULL, NULL, NULL, NULL, '2020-06-10 19:02:38');
INSERT INTO public.acc VALUES (1374, 'INVITE', '3800816571-841018392', '', '530719512-3800816571-185502518@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:22:51', 0, 0, 0, '19:26:16', NULL, NULL, NULL, NULL, '2020-06-10 19:26:16');
INSERT INTO public.acc VALUES (1375, 'INVITE', '3800816708-742139811', '', '530726001-3800816708-2109650036@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:25:08', 0, 0, 0, '19:28:32', NULL, NULL, NULL, NULL, '2020-06-10 19:28:32');
INSERT INTO public.acc VALUES (1376, 'INVITE', '3800816787-1183036770', '', '530729722-3800816787-212826161@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:26:27', 0, 0, 0, '19:29:52', NULL, NULL, NULL, NULL, '2020-06-10 19:29:52');
INSERT INTO public.acc VALUES (1377, 'INVITE', '3800817572-1447477134', '', '530766654-3800817572-249332476@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:39:32', 0, 0, 0, '19:42:57', NULL, NULL, NULL, NULL, '2020-06-10 19:42:57');
INSERT INTO public.acc VALUES (1378, 'INVITE', '3800817661-46357508', '', '530770772-3800817661-1030874194@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:41:01', 0, 0, 0, '19:44:25', NULL, NULL, NULL, NULL, '2020-06-10 19:44:25');
INSERT INTO public.acc VALUES (1379, 'INVITE', '3800818180-125427389', '', '530795846-3800818180-916662407@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:49:40', 0, 0, 0, '19:53:04', NULL, NULL, NULL, NULL, '2020-06-10 19:53:04');
INSERT INTO public.acc VALUES (1380, 'INVITE', '3800818299-955016629', '', '530801840-3800818299-1500908396@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:51:39', 0, 0, 0, '19:55:04', NULL, NULL, NULL, NULL, '2020-06-10 19:55:04');
INSERT INTO public.acc VALUES (1381, 'INVITE', '3800818388-1229543243', '', '530805999-3800818388-271903938@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:53:08', 0, 0, 0, '19:56:33', NULL, NULL, NULL, NULL, '2020-06-10 19:56:33');
INSERT INTO public.acc VALUES (1382, 'INVITE', '3800818725-1821997914', '', '530821245-3800818725-387716048@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 19:58:45', 0, 0, 0, '20:02:09', NULL, NULL, NULL, NULL, '2020-06-10 20:02:09');
INSERT INTO public.acc VALUES (1383, 'INVITE', '3800818991-1273639921', '', '530830837-3800818991-1182308599@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:03:11', 0, 0, 0, '20:06:35', NULL, NULL, NULL, NULL, '2020-06-10 20:06:35');
INSERT INTO public.acc VALUES (1384, 'INVITE', '3800819318-633650383', '', '530838365-3800819318-305398492@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:08:38', 0, 0, 0, '20:12:02', NULL, NULL, NULL, NULL, '2020-06-10 20:12:02');
INSERT INTO public.acc VALUES (1385, 'INVITE', '3800819583-1575368550', '', '530844434-3800819583-541589647@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:13:03', 0, 0, 0, '20:16:28', NULL, NULL, NULL, NULL, '2020-06-10 20:16:28');
INSERT INTO public.acc VALUES (1386, 'INVITE', '3800819983-1037012054', '', '530853494-3800819983-1222415429@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:19:43', 0, 0, 0, '20:23:08', NULL, NULL, NULL, NULL, '2020-06-10 20:23:08');
INSERT INTO public.acc VALUES (1387, 'INVITE', '3800820084-2133197829', 'FeeBtSjD7XBUN', '530855836-3800820084-699965564@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:21:24', 15, 14737, 0, '2020-06-10 20:21:24', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-10 20:25:04');
INSERT INTO public.acc VALUES (1388, 'INVITE', '3800820135-1422099607', 'gQ73Um3g461DH', '530857020-3800820135-1532310715@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:22:15', 15, 14558, 0, '2020-06-10 20:22:15', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-10 20:25:54');
INSERT INTO public.acc VALUES (1389, 'INVITE', '3800820436-1394571230', '', '530863903-3800820436-1269592461@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:27:16', 0, 0, 0, '20:30:41', NULL, NULL, NULL, NULL, '2020-06-10 20:30:41');
INSERT INTO public.acc VALUES (1390, 'INVITE', '3800820584-1647712157', '', '530867249-3800820584-1442967413@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:29:44', 0, 0, 0, '20:33:09', NULL, NULL, NULL, NULL, '2020-06-10 20:33:09');
INSERT INTO public.acc VALUES (1391, 'INVITE', '3800820800-619994976', '', '530872094-3800820800-464411195@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:33:20', 0, 0, 0, '20:36:44', NULL, NULL, NULL, NULL, '2020-06-10 20:36:44');
INSERT INTO public.acc VALUES (1392, 'INVITE', '3800820971-2022785313', '', '530876011-3800820971-1654357955@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:36:11', 0, 0, 0, '20:39:35', NULL, NULL, NULL, NULL, '2020-06-10 20:39:35');
INSERT INTO public.acc VALUES (1393, 'INVITE', '3800821193-414848500', '', '530881115-3800821193-984979179@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:39:53', 0, 0, 0, '20:43:17', NULL, NULL, NULL, NULL, '2020-06-10 20:43:17');
INSERT INTO public.acc VALUES (1394, 'INVITE', '3800821719-1059628654', '', '530892944-3800821719-223080614@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:48:39', 0, 0, 0, '20:52:03', NULL, NULL, NULL, NULL, '2020-06-10 20:52:03');
INSERT INTO public.acc VALUES (1395, 'INVITE', '3800821793-1739545953', '', '530894656-3800821793-495866708@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:49:53', 0, 0, 0, '20:53:17', NULL, NULL, NULL, NULL, '2020-06-10 20:53:17');
INSERT INTO public.acc VALUES (1396, 'INVITE', '3800821911-375365885', '', '530897277-3800821911-906430347@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 20:51:51', 0, 0, 0, '20:55:15', NULL, NULL, NULL, NULL, '2020-06-10 20:55:15');
INSERT INTO public.acc VALUES (1397, 'INVITE', '3800826772-602492782', '', '531005439-3800826772-446910026@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 22:12:52', 0, 0, 0, '22:16:16', NULL, NULL, NULL, NULL, '2020-06-10 22:16:16');
INSERT INTO public.acc VALUES (1398, 'INVITE', '3800826893-1402304495', '', '531007980-3800826893-2036687633@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 22:14:53', 0, 0, 0, '22:18:17', NULL, NULL, NULL, NULL, '2020-06-10 22:18:17');
INSERT INTO public.acc VALUES (1399, 'INVITE', '3800827097-1916040579', '', '531012300-3800827097-173272255@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 22:18:17', 0, 0, 0, '22:21:41', NULL, NULL, NULL, NULL, '2020-06-10 22:21:41');
INSERT INTO public.acc VALUES (1400, 'INVITE', '3800827390-1902529220', '', '531018496-3800827390-2095448517@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 22:23:10', 0, 0, 0, '22:26:35', NULL, NULL, NULL, NULL, '2020-06-10 22:26:35');
INSERT INTO public.acc VALUES (1401, 'INVITE', '3800829187-1216571776', '', '531056031-3800829187-233063088@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 22:53:07', 0, 0, 0, '22:56:32', NULL, NULL, NULL, NULL, '2020-06-10 22:56:32');
INSERT INTO public.acc VALUES (1402, 'INVITE', '3800829278-738717055', 'yN9ymFF2U3SKK', '531057949-3800829278-1657349787@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 22:54:38', 16, 15940, 0, '2020-06-10 22:54:38', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-10 22:58:19');
INSERT INTO public.acc VALUES (1403, 'INVITE', '3800829752-236470024', 'Zy2Qpa05rcg6e', '531067725-3800829752-398683064@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 23:02:32', 15, 15002, 0, '2020-06-10 23:02:32', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-10 23:06:12');
INSERT INTO public.acc VALUES (1404, 'INVITE', '3800829839-1302641670', '', '531069509-3800829839-475242071@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 23:03:59', 0, 0, 0, '23:07:24', NULL, NULL, NULL, NULL, '2020-06-10 23:07:24');
INSERT INTO public.acc VALUES (1405, 'INVITE', '3800829957-702273140', '', '531071938-3800829957-1455488470@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 23:05:57', 0, 0, 0, '23:09:21', NULL, NULL, NULL, NULL, '2020-06-10 23:09:21');
INSERT INTO public.acc VALUES (1406, 'INVITE', '3800830124-944245044', '', '531075334-3800830124-1372251949@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-10 23:08:44', 0, 0, 0, '23:12:08', NULL, NULL, NULL, NULL, '2020-06-10 23:12:08');
INSERT INTO public.acc VALUES (1407, 'INVITE', '3800870412-260278643', '', '531928205-3800870412-1577419455@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:20:12', 0, 0, 0, '10:23:37', NULL, NULL, NULL, NULL, '2020-06-11 10:23:37');
INSERT INTO public.acc VALUES (1408, 'INVITE', '3800870741-1473698885', '', '531937467-3800870741-16125438@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:25:41', 0, 0, 0, '10:29:06', NULL, NULL, NULL, NULL, '2020-06-11 10:29:06');
INSERT INTO public.acc VALUES (1409, 'INVITE', '3800870959-635173300', '', '531943601-3800870959-283730049@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:29:19', 0, 0, 0, '10:32:44', NULL, NULL, NULL, NULL, '2020-06-11 10:32:44');
INSERT INTO public.acc VALUES (1410, 'INVITE', '3800871054-1177475062', '', '531946350-3800871054-719871144@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:30:54', 0, 0, 0, '10:34:18', NULL, NULL, NULL, NULL, '2020-06-11 10:34:18');
INSERT INTO public.acc VALUES (1411, 'INVITE', '3800871314-538660169', '', '531953939-3800871314-307782876@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:35:14', 0, 0, 0, '10:38:39', NULL, NULL, NULL, NULL, '2020-06-11 10:38:39');
INSERT INTO public.acc VALUES (1412, 'INVITE', '3800871523-128202944', '', '531960009-3800871523-1765134436@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:38:43', 0, 0, 0, '10:42:08', NULL, NULL, NULL, NULL, '2020-06-11 10:42:08');
INSERT INTO public.acc VALUES (1413, 'INVITE', '3800871648-130971270', '', '531963640-3800871648-866417082@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:40:48', 0, 0, 0, '10:44:13', NULL, NULL, NULL, NULL, '2020-06-11 10:44:13');
INSERT INTO public.acc VALUES (1414, 'INVITE', '3800871770-1664502951', '', '531967144-3800871770-1404916331@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:42:50', 0, 0, 0, '10:46:15', NULL, NULL, NULL, NULL, '2020-06-11 10:46:15');
INSERT INTO public.acc VALUES (1415, 'INVITE', '3800871972-1334237953', 'BBj1BFagpQU6S', '531972924-3800871972-498475323@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:46:13', 9, 9667, 1, '2020-06-11 10:46:12', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-11 10:49:47');
INSERT INTO public.acc VALUES (1416, 'INVITE', '3800872063-302304711', 'cmBtDaUKK0HSN', '531975524-3800872063-1961479207@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:47:43', 6, 5956, 0, '2020-06-11 10:47:43', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-11 10:51:14');
INSERT INTO public.acc VALUES (1417, 'INVITE', '3800872195-1793985844', 'DX4jF5BQg97BH', '531979321-3800872195-1103349877@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:49:55', 10, 10376, 0, '2020-06-11 10:49:55', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-11 10:53:30');
INSERT INTO public.acc VALUES (1418, 'INVITE', '3800872294-152981661', 'e6XBH0vtDjyyc', '531982251-3800872294-373562734@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:51:34', 10, 9386, 0, '2020-06-11 10:51:34', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-11 10:55:09');
INSERT INTO public.acc VALUES (1419, 'INVITE', '3800872366-328805441', 'FFQ4jUDyaUmHr', '531984465-3800872366-369243051@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:52:46', 17, 16886, 0, '2020-06-11 10:52:46', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-11 10:56:28');
INSERT INTO public.acc VALUES (1420, 'INVITE', '3800872560-1297482117', 'grgXmpy173a4K', '531990385-3800872560-2140922582@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 10:56:00', 13, 13166, 0, '2020-06-11 10:56:00', '61981203815', '9055', '8392', '10.123.125.11', '2020-06-11 10:59:38');
INSERT INTO public.acc VALUES (1421, 'INVITE', '3800874163-243312340', '', '532038364-3800874163-276335274@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 11:22:43', 0, 0, 0, '11:26:08', NULL, NULL, NULL, NULL, '2020-06-11 11:26:08');
INSERT INTO public.acc VALUES (1422, 'INVITE', '3800874248-1687847776', '', '532040915-3800874248-981275252@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 11:24:08', 0, 0, 0, '11:27:33', NULL, NULL, NULL, NULL, '2020-06-11 11:27:33');
INSERT INTO public.acc VALUES (1423, 'INVITE', '3800879674-469034300', '', '532196990-3800879674-168384532@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 12:54:34', 0, 0, 0, '12:57:59', NULL, NULL, NULL, NULL, '2020-06-11 12:57:59');
INSERT INTO public.acc VALUES (1424, 'INVITE', '3800879716-898577955', '', '532198240-3800879716-847945368@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-11 12:55:17', 0, 0, 0, '12:58:41', NULL, NULL, NULL, NULL, '2020-06-11 12:58:41');
INSERT INTO public.acc VALUES (1425, 'INVITE', '3800960931-354381984', 'as040b839a', '534513036-3800960931-1160546576@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-12 11:28:51', 6, 6492, 0, '2020-06-12 11:28:51', '61981203815', '8303', '8392', '10.123.125.11', '2020-06-12 11:32:23');
INSERT INTO public.acc VALUES (1426, 'INVITE', '3800961127-1610620601', 'as31274a39', '534524745-3800961127-1479275732@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-12 11:32:07', 10, 9244, 0, '2020-06-12 11:32:07', '61981203815', '8303', '8392', '10.123.125.11', '2020-06-12 11:35:42');
INSERT INTO public.acc VALUES (1427, 'INVITE', '3800961329-1687986558', 'as77f6fbbb', '534536573-3800961329-772357730@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-12 11:35:29', 15, 14804, 0, '2020-06-12 11:35:29', '61981203815', '8303', '8392', '10.123.125.11', '2020-06-12 11:39:09');
INSERT INTO public.acc VALUES (1428, 'INVITE', '3800961510-338081578', 'as28565aff', '534546974-3800961510-1719576094@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-12 11:38:30', 51, 50658, 0, '2020-06-12 11:38:30', '61981203815', '8303', '8392', '10.123.125.11', '2020-06-12 11:42:47');
INSERT INTO public.acc VALUES (1429, 'INVITE', '3800980944-606611953', 'as1b02f860', '535787313-3800980944-1522301448@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-12 17:02:24', 39, 39647, 0, '2020-06-12 17:02:24', '61981203815', '8850', '8392', '10.123.125.11', '2020-06-12 17:06:29');
INSERT INTO public.acc VALUES (1430, 'INVITE', '3800993974-1541346235', 'as48364659', '536452094-3800993974-229684861@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-12 20:39:34', 43, 42501, 0, '2020-06-12 20:39:34', '89994442549', '8850', '8392', '10.123.125.11', '2020-06-12 20:43:43');
INSERT INTO public.acc VALUES (1431, 'INVITE', '3801002795-982277065', 'as28cf9c09', '536641712-3801002795-1400873387@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-12 23:06:35', 38, 37493, 0, '2020-06-12 23:06:35', '61996150015', '8850', '8392', '10.123.125.11', '2020-06-12 23:10:39');
INSERT INTO public.acc VALUES (1432, 'INVITE', '3801006780-1685915948', 'as11c4bb5d', '536722005-3801006780-849105766@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-13 00:13:00', 2, 1660, 0, '2020-06-13 00:13:00', '61996150015', '8850', '8392', '10.123.125.11', '2020-06-13 00:16:28');
INSERT INTO public.acc VALUES (1433, 'INVITE', '3801057794-408219702', 'as3b688663', '538537370-3801057794-2086215365@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-13 14:23:14', 39, 38498, 0, '2020-06-13 14:23:14', '82996831899', '8850', '8392', '10.123.125.11', '2020-06-13 14:27:19');
INSERT INTO public.acc VALUES (1434, 'INVITE', '3801069566-688364809', 'as096423e8', '538918148-3801069566-442659187@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-13 17:39:27', 26, 26583, 1, '2020-06-13 17:39:26', '61996150015', '8850', '8392', '10.123.125.11', '2020-06-13 17:43:20');
INSERT INTO public.acc VALUES (1435, 'INVITE', '3801069607-1686917238', 'as2743010b', '538919130-3801069607-1246299476@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-13 17:40:07', 40, 39674, 0, '2020-06-13 17:40:07', '61996150015', '8850', '8392', '10.123.125.11', '2020-06-13 17:44:13');
INSERT INTO public.acc VALUES (1436, 'INVITE', '3801069756-1420219968', 'as2089df3e', '538922755-3801069756-1881088910@SBC40-CASBC.ngn.embratel.net.br', '200', 'OK', '2020-06-13 17:42:36', 48, 47831, 0, '2020-06-13 17:42:36', '77998700171', '8850', '8392', '10.123.125.11', '2020-06-13 17:46:50');


--
-- Name: acc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.acc_id_seq', 1436, true);


--
-- Data for Name: active_watchers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: active_watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.active_watchers_id_seq', 1, false);


--
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address VALUES (1, 2, '10.123.121.0', 24, 5060, 'udp', NULL, 'LAN');


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.address_id_seq', 4, true);


--
-- Data for Name: b2b_entities; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: b2b_entities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.b2b_entities_id_seq', 1, false);


--
-- Data for Name: b2b_logic; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: b2b_logic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.b2b_logic_id_seq', 8, true);


--
-- Data for Name: b2b_sca; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: b2b_sca_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.b2b_sca_id_seq', 1, false);


--
-- Data for Name: cachedb; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: call_mos; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.call_mos VALUES (71, '423300977-3797676302-1078064146@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0599999999999999978, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (72, '423429175-3797677778-1443551392@SBC40-CASBC.ngn.embratel.net.br', 0.23000000000000001, 0.0500000000000000028, 4);
INSERT INTO public.call_mos VALUES (73, '424730043-3797707666-297177678@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (74, '426812347-3797768602-1247871108@SBC40-CASBC.ngn.embratel.net.br', 0.209999999999999992, 0.0599999999999999978, 4.20000000000000018);
INSERT INTO public.call_mos VALUES (75, '426919215-3797770016-312983769@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (76, '427509001-3797782511-1856053223@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0200000000000000004, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (77, '427749546-3797788799-1642294111@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (78, '428141183-3797800882-1877696309@SBC40-CASBC.ngn.embratel.net.br', 0.110000000000000001, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (79, '431594701-3797923278-526027687@SBC40-CASBC.ngn.embratel.net.br', 0.110000000000000001, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (80, '432564177-3797946043-492973842@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (81, '433149178-3797959618-2016604210@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (82, '438698730-3798190004-75830960@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (83, '443393647-3798294121-1218691221@SBC40-CASBC.ngn.embratel.net.br', 0.0899999999999999967, 0.0400000000000000008, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (84, '447207970-3798377206-400855250@SBC40-CASBC.ngn.embratel.net.br', 0.0700000000000000067, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (85, '448355950-3798404887-1405598726@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (86, '449215363-3798446058-350348314@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (87, '450832565-3798473432-1071514883@SBC40-CASBC.ngn.embratel.net.br', 0.119999999999999996, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (88, '451076913-3798476404-929073864@SBC40-CASBC.ngn.embratel.net.br', 0.110000000000000001, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (89, '453248498-3798553079-1180571729@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (90, '453271171-3798553622-1350792194@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (91, '453281336-3798553875-645143093@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (92, '453294990-3798554211-1921397720@SBC40-CASBC.ngn.embratel.net.br', 0.0700000000000000067, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (93, '453299154-3798554313-1529739414@SBC40-CASBC.ngn.embratel.net.br', 0.0899999999999999967, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (94, '453340260-3798555333-1590020733@SBC40-CASBC.ngn.embratel.net.br', 0.110000000000000001, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (95, '453349547-3798555570-2093045353@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (96, '453356007-3798555740-1944111587@SBC40-CASBC.ngn.embratel.net.br', 0.200000000000000011, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (97, '455891198-3798631353-823150544@SBC40-CASBC.ngn.embratel.net.br', 0.149999999999999994, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (98, '455894083-3798631391-489867287@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (99, '456827242-3798650784-1992178530@SBC40-CASBC.ngn.embratel.net.br', 0.160000000000000003, 0.0299999999999999989, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (100, '458177380-3798717812-1299220553@SBC40-CASBC.ngn.embratel.net.br', 0.260000000000000009, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (101, '458178503-3798717864-63401688@SBC40-CASBC.ngn.embratel.net.br', 0.200000000000000011, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (102, '458179351-3798717903-476279103@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (103, '464369321-3798883136-2055038570@SBC40-CASBC.ngn.embratel.net.br', 0.110000000000000001, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (104, '464376097-3798883202-945449616@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0599999999999999978, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (105, '464786243-3798887409-958621252@SBC40-CASBC.ngn.embratel.net.br', 0.110000000000000001, 0.110000000000000001, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (106, '466641934-3798908012-515991610@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (107, '466653877-3798908155-1866291360@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0599999999999999978, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (108, '466658487-3798908214-1685072176@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0599999999999999978, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (109, '466792759-3798909946-1967904508@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (110, '467393660-3798918555-1132622594@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (111, '468768383-3798970734-413849936@SBC40-CASBC.ngn.embratel.net.br', 0.0800000000000000017, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (112, '471280945-3799052725-768756665@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (113, '489607126-3799660020-942289391@SBC40-CASBC.ngn.embratel.net.br', 0.110000000000000001, 0.0599999999999999978, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (114, '489612228-3799660086-184106656@SBC40-CASBC.ngn.embratel.net.br', 0.100000000000000006, 0.0500000000000000028, 4.29999999999999982);
INSERT INTO public.call_mos VALUES (115, '489659767-3799660698-922674618@SBC40-CASBC.ngn.embratel.net.br', 0.0800000000000000017, 0.0800000000000000017, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (116, '489662032-3799660724-889311388@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0599999999999999978, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (117, '489669365-3799660820-663910291@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0599999999999999978, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (118, '489775065-3799662174-584813797@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (119, '489796113-3799662443-483005719@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (120, '489865662-3799663343-1694698524@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (121, '489956370-3799664550-1011022200@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0599999999999999978, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (122, '489965728-3799664677-1719871976@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (123, '490009410-3799665296-689395282@SBC40-CASBC.ngn.embratel.net.br', 0.0599999999999999978, 0.0599999999999999978, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (124, '490010725-3799665316-1226911752@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);
INSERT INTO public.call_mos VALUES (125, '490012457-3799665341-535652300@SBC40-CASBC.ngn.embratel.net.br', 0.0500000000000000028, 0.0500000000000000028, 4.40000000000000036);


--
-- Name: call_mos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.call_mos_id_seq', 125, true);


--
-- Data for Name: carrierfailureroute; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: carrierfailureroute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrierfailureroute_id_seq', 1, false);


--
-- Data for Name: carrierroute; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: carrierroute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carrierroute_id_seq', 1, false);


--
-- Data for Name: cc_agents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cc_agents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cc_agents_id_seq', 1, false);


--
-- Data for Name: cc_calls; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cc_calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cc_calls_id_seq', 1, false);


--
-- Data for Name: cc_cdrs; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cc_cdrs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cc_cdrs_id_seq', 1, false);


--
-- Data for Name: cc_flows; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cc_flows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cc_flows_id_seq', 1, false);


--
-- Data for Name: closeddial; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: closeddial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.closeddial_id_seq', 1, false);


--
-- Data for Name: clusterer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clusterer VALUES (1, 1, 1, 'bin:127.0.0.1:5566', 1, 3, 50, '127.0.0.1', 'seed', 'Node A');


--
-- Name: clusterer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clusterer_id_seq', 1, false);


--
-- Data for Name: codec; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.codec VALUES ('{
    "g729": {
        "codec": "G729",
        "ptime": 20
    },
    "g711u": {
        "codec": "PCMU",
        "ptime": 20
    },
    "g711a": {
        "codec": "PCMA",
        "ptime": 20
    },
    "ilbc": {
        "codec": "iLBC",
        "ptime": 20
    },
    "g722": {
        "codec": "G722",
        "ptime": 20
    },
    "g723": {
        "codec": "G723",
        "ptime": 20
    },
    "gsm": {
        "codec": "GSM",
        "ptime": 20
    },
    "opus": {
        "codec": "opus",
        "ptime": 20
    },
    "speex": {
        "codec": "speex",
        "ptime": 20
    }
}');


--
-- Data for Name: cpl; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cpl_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cpl_id_seq', 1, false);


--
-- Data for Name: dbaliases; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: dbaliases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dbaliases_id_seq', 1, false);


--
-- Data for Name: dialog; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: dialplan; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.dialplan VALUES (5, 1, 1, 1, '8850', 1, '8850', '9055', '', 1, 'GW=1');
INSERT INTO public.dialplan VALUES (4, 1, 1, 1, '8392', 1, '8392', '8850', '', 1, 'DP=1;TF=5;TI=10;FG=f;RS=FGTS;ALG=4;MAX=0');
INSERT INTO public.dialplan VALUES (6, 1, 1, 1, '8850', 1, '8850', '8854', '', 0, 'GW=7');


--
-- Name: dialplan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dialplan_id_seq', 8, true);


--
-- Data for Name: dialplan_local; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.dialplan_local VALUES (1, 2, 1, 1, '8850', 1, '8850', '', '', 0, 'GW=1');


--
-- Name: dialplan_local_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dialplan_local_id_seq', 1, true);


--
-- Data for Name: dispatcher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dispatcher VALUES (2, 1, 'sip:10.123.125.81:5060', NULL, 0, '1', 0, 'STUN=yes;STID=0;ENCO=yes;DRP=RED;RT=0', 'CTSDCAPLLX0155
');
INSERT INTO public.dispatcher VALUES (1, 1, 'sip:10.123.125.83:5060', NULL, 0, '1', 0, 'STUN=yes;STID=0;ENCO=yes', 'CTSDCAPLLX0154');


--
-- Name: dispatcher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dispatcher_id_seq', 2, true);


--
-- Data for Name: domain; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.domain VALUES (1, '10.123.125.11', NULL, '1900-01-01 00:00:01');


--
-- Name: domain_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domain_id_seq', 1, true);


--
-- Data for Name: domainpolicy; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: domainpolicy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domainpolicy_id_seq', 1, false);


--
-- Data for Name: dp_id; Type: TABLE DATA; Schema: public; Owner: admin
--



--
-- Name: dp_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.dp_id_id_seq', 4, true);


--
-- Data for Name: dr_carriers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dr_carriers VALUES (1, '1', '3', 0, 0, NULL, 'FGTS', '');


--
-- Name: dr_carriers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dr_carriers_id_seq', 2, true);


--
-- Data for Name: dr_gateways; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dr_gateways VALUES (12, '3', 0, '10.123.125.81:5060', 0, NULL, 'RF=0;TF=2;TI=5', 1, 0, NULL, 'FGTS_2019');
INSERT INTO public.dr_gateways VALUES (9, '7', 0, '10.123.125.93:5060', 0, NULL, 'RF=0;TF=2;TI=5;STUN=yes;STID=0;ENCO=yes', 1, 1, NULL, 'IVR-FS');
INSERT INTO public.dr_gateways VALUES (5, '6', 0, '10.123.124.52:5060', 0, NULL, 'RF=0;TF=5;TI=60', 1, 1, NULL, '10.123.125.45
');
INSERT INTO public.dr_gateways VALUES (4, '2', 1, '10.123.125.16:5020', 0, NULL, 'RF=0;TF=5;TI=60', 1, 1, NULL, 'CTSDCAPLLX0156');
INSERT INTO public.dr_gateways VALUES (1, '1', 1, '10.123.125.15:5020', 0, NULL, 'RF=0;TF=5;TI=60', 1, 1, NULL, 'CTSDCAPLLX0155');
INSERT INTO public.dr_gateways VALUES (11, '10', 0, '10.123.125.34:5060', 0, NULL, 'RF=0;TF=5;TI=60', 1, 1, NULL, '8068');
INSERT INTO public.dr_gateways VALUES (6, '4', 0, '10.123.125.96:5080', 0, NULL, 'RF=0;TF=5;TI=60', 1, 1, NULL, 'CTSDCAPLLX0297');
INSERT INTO public.dr_gateways VALUES (7, '5', 0, '10.123.125.14:5060', 0, NULL, 'RF=0;TF=2;TI=5', 1, 1, NULL, 'CTSDCAPLLX0294
');


--
-- Name: dr_gateways_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dr_gateways_id_seq', 12, true);


--
-- Data for Name: dr_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: dr_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dr_groups_id_seq', 13, true);


--
-- Data for Name: dr_partitions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: dr_partitions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dr_partitions_id_seq', 1, false);


--
-- Data for Name: dr_rules; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.dr_rules VALUES (0, '1', '8850', '', 0, '', '#1', 'TF=5;TI=10;RF=0;FG=W', 'TESTE', 'N', NULL);


--
-- Name: dr_rules_ruleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dr_rules_ruleid_seq', 3, true);


--
-- Data for Name: emergency_report; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: emergency_report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emergency_report_id_seq', 1, false);


--
-- Data for Name: emergency_routing; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: emergency_routing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emergency_routing_id_seq', 1, false);


--
-- Data for Name: emergency_service_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: emergency_service_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.emergency_service_provider_id_seq', 1, false);


--
-- Data for Name: fraud_detection; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: fraud_detection_ruleid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fraud_detection_ruleid_seq', 1, false);


--
-- Data for Name: freeswitch; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: freeswitch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.freeswitch_id_seq', 2, true);


--
-- Data for Name: globalblacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: globalblacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.globalblacklist_id_seq', 1, false);


--
-- Data for Name: grp; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: grp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grp_id_seq', 1, true);


--
-- Data for Name: imc_members; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: imc_members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imc_members_id_seq', 1, false);


--
-- Data for Name: imc_rooms; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: imc_rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imc_rooms_id_seq', 1, false);


--
-- Data for Name: load_balancer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.load_balancer VALUES (145, 1, 'sip:10.123.125.27:5080', 'FGTS=150', 0, 'CTSDCAPLLX0167', 'STUN=yes;STID=0;ENCO=yes');
INSERT INTO public.load_balancer VALUES (144, 1, 'sip:10.123.125.26:5080', 'FGTS=150', 0, 'CTSDCAPLLX0166', 'STUN=yes;STID=0;ENCO=yes');
INSERT INTO public.load_balancer VALUES (182, 4, 'sip:10.123.125.81:5060', 'FGTS=150', 0, 'teste', 'STUN=yes;STID=0;ENCO=yes
');


--
-- Name: load_balancer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.load_balancer_id_seq', 182, true);


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: location_contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.location_contact_id_seq', 1, false);


--
-- Data for Name: missed_calls; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.missed_calls VALUES (76, 'BYE', 'SBCC4.160.850.1590843285', '3799832086-1099128877', '495941416-3799832086-600565106@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-05-30 09:55:14', 0, 0, 1590843314, '1969-12-31 21:00:00', '', '', '', '', '2020-05-30 09:58:31');
INSERT INTO public.missed_calls VALUES (77, 'BYE', 'SBCC4.609.65.1590843410', '3799832211-204843501', '495948531-3799832211-1303720941@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-05-30 09:57:19', 0, 0, 1590843439, '1969-12-31 21:00:00', '', '', '', '', '2020-05-30 10:00:36');
INSERT INTO public.missed_calls VALUES (78, 'BYE', 'SBCC4.589.580.1590880960', '3799869761-223075331', '497455853-3799869761-626057915@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-05-30 20:23:10', 0, 0, 1590880990, '1969-12-31 21:00:00', '', '', '', '', '2020-05-30 20:26:26');
INSERT INTO public.missed_calls VALUES (79, 'BYE', 'SBCC4.715.519.1590881025', '3799869826-1646945907', '497457196-3799869826-893950094@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-05-30 20:24:14', 0, 0, 1590881054, '1969-12-31 21:00:00', '', '', '', '', '2020-05-30 20:27:31');
INSERT INTO public.missed_calls VALUES (80, 'BYE', 'SBCC4.976.663.1591030996', '3800019797-1887963012', '501854007-3800019797-275330076@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-01 14:03:30', 0, 0, 1591031010, '1969-12-31 21:00:00', '', '', '', '', '2020-06-01 14:06:48');
INSERT INTO public.missed_calls VALUES (81, 'BYE', 'SBCC4.276.932.1591031070', '3800019871-325618614', '501858901-3800019871-1008114140@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-01 14:04:51', 0, 0, 1591031091, '1969-12-31 21:00:00', '', '', '', '', '2020-06-01 14:08:09');
INSERT INTO public.missed_calls VALUES (82, 'BYE', 'SBCC4.830.222.1591057496', '3800046297-176968277', '503368001-3800046297-1867112197@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-01 21:25:19', 0, 0, 1591057519, '1969-12-31 21:00:00', '', '', '', '', '2020-06-01 21:28:38');
INSERT INTO public.missed_calls VALUES (83, 'BYE', 'SBCC4.819.97.1591068187', '3800056988-667276447', '503589799-3800056988-1309074260@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-02 00:23:20', 0, 0, 1591068200, '1969-12-31 21:00:00', '', '', '', '', '2020-06-02 00:26:38');
INSERT INTO public.missed_calls VALUES (84, 'BYE', 'SBCC4.330.166.1591104746', '3800093547-938833255', '504798707-3800093547-451573703@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-02 10:32:55', 0, 0, 1591104775, '1969-12-31 21:00:00', '', '', '', '', '2020-06-02 10:36:14');
INSERT INTO public.missed_calls VALUES (85, 'BYE', 'SBCC4.265.971.1591106985', '3800095786-285099772', '504979140-3800095786-1502970302@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-02 11:10:14', 0, 0, 1591107014, '1969-12-31 21:00:00', '', '', '', '', '2020-06-02 11:13:33');
INSERT INTO public.missed_calls VALUES (86, 'BYE', 'SBCC4.904.747.1591107164', '3800095965-2110529718', '504992775-3800095965-331636367@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-02 11:13:24', 0, 0, 1591107204, '1969-12-31 21:00:00', '', '', '', '', '2020-06-02 11:16:43');
INSERT INTO public.missed_calls VALUES (87, 'BYE', 'SBCC4.359.257.1591107525', '3800096326-1421017891', '505020989-3800096326-1105538771@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-02 11:19:24', 0, 0, 1591107564, '1969-12-31 21:00:00', '', '', '', '', '2020-06-02 11:22:42');
INSERT INTO public.missed_calls VALUES (88, 'BYE', 'SBCC4.428.840.1591108279', '3800097080-1055628861', '505078463-3800097080-958413112@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-02 11:31:57', 0, 0, 1591108317, '1969-12-31 21:00:00', '', '', '', '', '2020-06-02 11:35:15');
INSERT INTO public.missed_calls VALUES (89, 'BYE', 'SBCC4.799.935.1591108543', '3800097344-956154944', '505097229-3800097344-1737135342@SBC40-CASBC.ngn.embratel.net.br', '404', 'Not Found', '2020-06-02 11:36:05', 0, 0, 1591108565, '1969-12-31 21:00:00', '', '', '', '', '2020-06-02 11:39:24');
INSERT INTO public.missed_calls VALUES (90, 'INVITE', '3800960649-1392912372', 'as0383c66e', '534496283-3800960649-617674578@SBC40-CASBC.ngn.embratel.net.br', '403', 'Forbidden', '2020-06-12 11:24:09', 0, 0, 0, '2020-06-12 11:24:09', '61981203815', '8230', '8392', '10.123.125.11', '2020-06-12 11:27:34');
INSERT INTO public.missed_calls VALUES (91, 'INVITE', '3800960759-1839326800', 'as34a3cbb6', '534502954-3800960759-688609342@SBC40-CASBC.ngn.embratel.net.br', '403', 'Forbidden', '2020-06-12 11:25:59', 0, 0, 0, '2020-06-12 11:25:59', '61981203815', '8303', '8392', '10.123.125.11', '2020-06-12 11:29:25');
INSERT INTO public.missed_calls VALUES (92, 'INVITE', '3800961451-52496385', '', '534543426-3800961451-109758231@SBC40-CASBC.ngn.embratel.net.br', '408', 'Request Timeout', '2020-06-12 11:37:33', 0, 0, 2, '2020-06-12 11:37:31', '61981203815', '8303', '8392', '10.123.125.11', '2020-06-12 11:40:59');
INSERT INTO public.missed_calls VALUES (93, 'INVITE', '3800961478-156250941', '', '534544990-3800961478-923449539@SBC40-CASBC.ngn.embratel.net.br', '408', 'Request Timeout', '2020-06-12 11:38:00', 0, 0, 2, '2020-06-12 11:37:58', '61981203815', '8303', '8392', '10.123.125.11', '2020-06-12 11:41:26');


--
-- Name: missed_calls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.missed_calls_id_seq', 93, true);


--
-- Data for Name: networks; Type: TABLE DATA; Schema: public; Owner: admin
--

INSERT INTO public.networks VALUES (1, 1, '10.123.125.0', 24, 5060, 'udp', NULL, 'LAN');
INSERT INTO public.networks VALUES (2, 1, '10.123.124.0', 24, 5060, 'udp', NULL, 'LAN');
INSERT INTO public.networks VALUES (3, 1, '10.123.121.0', 24, 5060, 'udp', NULL, 'LAN');


--
-- Name: networks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.networks_id_seq', 5, true);


--
-- Data for Name: presentity; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: presentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presentity_id_seq', 1, false);


--
-- Data for Name: pua; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: pua_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pua_id_seq', 1, false);


--
-- Data for Name: re_grp; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: re_grp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.re_grp_id_seq', 1, false);


--
-- Data for Name: registrant; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: registrant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registrant_id_seq', 1, false);


--
-- Data for Name: rls_presentity; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: rls_presentity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rls_presentity_id_seq', 1, false);


--
-- Data for Name: rls_watchers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: rls_watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rls_watchers_id_seq', 1, false);


--
-- Data for Name: route_tree; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: route_tree_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.route_tree_id_seq', 1, false);


--
-- Data for Name: rtpengine; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rtpengine VALUES (1, 'udp:10.123.125.227:2223', 0, 1, 0);
INSERT INTO public.rtpengine VALUES (2, 'udp:10.123.125.228:2223', 0, 1, 0);


--
-- Name: rtpengine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rtpengine_id_seq', 2, true);


--
-- Data for Name: rtpproxy_sockets; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: rtpproxy_sockets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rtpproxy_sockets_id_seq', 1, false);


--
-- Data for Name: silo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: silo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.silo_id_seq', 1, false);


--
-- Data for Name: sip_trace; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: sip_trace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sip_trace_id_seq', 1, false);


--
-- Data for Name: speed_dial; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: speed_dial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.speed_dial_id_seq', 1, false);


--
-- Data for Name: subscriber; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: subscriber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subscriber_id_seq', 1, false);


--
-- Data for Name: tls_mgm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: tls_mgm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tls_mgm_id_seq', 1, false);


--
-- Data for Name: uri; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: uri_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.uri_id_seq', 1, false);


--
-- Data for Name: userblacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: userblacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.userblacklist_id_seq', 1, false);


--
-- Data for Name: usr_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: usr_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usr_preferences_id_seq', 1, false);


--
-- Data for Name: version; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.version VALUES ('acc', 7);
INSERT INTO public.version VALUES ('missed_calls', 5);
INSERT INTO public.version VALUES ('dbaliases', 2);
INSERT INTO public.version VALUES ('subscriber', 7);
INSERT INTO public.version VALUES ('usr_preferences', 3);
INSERT INTO public.version VALUES ('b2b_sca', 1);
INSERT INTO public.version VALUES ('b2b_entities', 1);
INSERT INTO public.version VALUES ('b2b_logic', 3);
INSERT INTO public.version VALUES ('cachedb', 2);
INSERT INTO public.version VALUES ('cc_flows', 1);
INSERT INTO public.version VALUES ('cc_agents', 1);
INSERT INTO public.version VALUES ('cc_cdrs', 1);
INSERT INTO public.version VALUES ('carrierroute', 3);
INSERT INTO public.version VALUES ('carrierfailureroute', 2);
INSERT INTO public.version VALUES ('route_tree', 2);
INSERT INTO public.version VALUES ('closeddial', 1);
INSERT INTO public.version VALUES ('clusterer', 4);
INSERT INTO public.version VALUES ('cpl', 2);
INSERT INTO public.version VALUES ('dialog', 10);
INSERT INTO public.version VALUES ('dialplan', 5);
INSERT INTO public.version VALUES ('dispatcher', 8);
INSERT INTO public.version VALUES ('domain', 3);
INSERT INTO public.version VALUES ('domainpolicy', 3);
INSERT INTO public.version VALUES ('dr_gateways', 6);
INSERT INTO public.version VALUES ('dr_groups', 2);
INSERT INTO public.version VALUES ('dr_partitions', 1);
INSERT INTO public.version VALUES ('emergency_routing', 1);
INSERT INTO public.version VALUES ('emergency_report', 1);
INSERT INTO public.version VALUES ('emergency_service_provider', 1);
INSERT INTO public.version VALUES ('fraud_detection', 1);
INSERT INTO public.version VALUES ('freeswitch', 1);
INSERT INTO public.version VALUES ('grp', 3);
INSERT INTO public.version VALUES ('re_grp', 2);
INSERT INTO public.version VALUES ('imc_rooms', 2);
INSERT INTO public.version VALUES ('imc_members', 2);
INSERT INTO public.version VALUES ('silo', 6);
INSERT INTO public.version VALUES ('address', 5);
INSERT INTO public.version VALUES ('presentity', 5);
INSERT INTO public.version VALUES ('active_watchers', 12);
INSERT INTO public.version VALUES ('watchers', 4);
INSERT INTO public.version VALUES ('xcap', 4);
INSERT INTO public.version VALUES ('pua', 8);
INSERT INTO public.version VALUES ('registrant', 1);
INSERT INTO public.version VALUES ('rls_presentity', 1);
INSERT INTO public.version VALUES ('rls_watchers', 2);
INSERT INTO public.version VALUES ('rtpengine', 1);
INSERT INTO public.version VALUES ('rtpproxy_sockets', 0);
INSERT INTO public.version VALUES ('sip_trace', 5);
INSERT INTO public.version VALUES ('speed_dial', 3);
INSERT INTO public.version VALUES ('tls_mgm', 2);
INSERT INTO public.version VALUES ('uri', 2);
INSERT INTO public.version VALUES ('userblacklist', 2);
INSERT INTO public.version VALUES ('globalblacklist', 2);
INSERT INTO public.version VALUES ('location', 1013);
INSERT INTO public.version VALUES ('networks', 5);
INSERT INTO public.version VALUES ('dr_rules', 4);
INSERT INTO public.version VALUES ('dr_carriers', 3);
INSERT INTO public.version VALUES ('load_balancer', 3);
INSERT INTO public.version VALUES ('dialplan_local', 5);


--
-- Data for Name: watchers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: watchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.watchers_id_seq', 1, false);


--
-- Data for Name: xcap; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: xcap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.xcap_id_seq', 1, false);


--
-- Name: acc_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.acc
    ADD CONSTRAINT acc_pkey PRIMARY KEY (id);


--
-- Name: active_watchers_active_watchers_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.active_watchers
    ADD CONSTRAINT active_watchers_active_watchers_idx UNIQUE (presentity_uri, callid, to_tag, from_tag);


--
-- Name: active_watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.active_watchers
    ADD CONSTRAINT active_watchers_pkey PRIMARY KEY (id);


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: b2b_entities_b2b_entities_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.b2b_entities
    ADD CONSTRAINT b2b_entities_b2b_entities_idx UNIQUE (type, tag0, tag1, callid);


--
-- Name: b2b_entities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.b2b_entities
    ADD CONSTRAINT b2b_entities_pkey PRIMARY KEY (id);


--
-- Name: b2b_logic_b2b_logic_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.b2b_logic
    ADD CONSTRAINT b2b_logic_b2b_logic_idx UNIQUE (si_key);


--
-- Name: b2b_logic_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.b2b_logic
    ADD CONSTRAINT b2b_logic_pkey PRIMARY KEY (id);


--
-- Name: b2b_sca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.b2b_sca
    ADD CONSTRAINT b2b_sca_pkey PRIMARY KEY (id);


--
-- Name: b2b_sca_sca_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.b2b_sca
    ADD CONSTRAINT b2b_sca_sca_idx UNIQUE (shared_line);


--
-- Name: cachedb_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cachedb
    ADD CONSTRAINT cachedb_pkey PRIMARY KEY (keyname);


--
-- Name: call_mos_callid_key; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY public.call_mos
    ADD CONSTRAINT call_mos_callid_key UNIQUE (callid);


--
-- Name: call_mos_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY public.call_mos
    ADD CONSTRAINT call_mos_pkey PRIMARY KEY (id);


--
-- Name: carrierfailureroute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.carrierfailureroute
    ADD CONSTRAINT carrierfailureroute_pkey PRIMARY KEY (id);


--
-- Name: carrierroute_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.carrierroute
    ADD CONSTRAINT carrierroute_pkey PRIMARY KEY (id);


--
-- Name: cc_agents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cc_agents
    ADD CONSTRAINT cc_agents_pkey PRIMARY KEY (id);


--
-- Name: cc_agents_unique_agentid; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cc_agents
    ADD CONSTRAINT cc_agents_unique_agentid UNIQUE (agentid);


--
-- Name: cc_calls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cc_calls
    ADD CONSTRAINT cc_calls_pkey PRIMARY KEY (id);


--
-- Name: cc_calls_unique_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cc_calls
    ADD CONSTRAINT cc_calls_unique_id UNIQUE (b2buaid);


--
-- Name: cc_cdrs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cc_cdrs
    ADD CONSTRAINT cc_cdrs_pkey PRIMARY KEY (id);


--
-- Name: cc_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cc_flows
    ADD CONSTRAINT cc_flows_pkey PRIMARY KEY (id);


--
-- Name: cc_flows_unique_flowid; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cc_flows
    ADD CONSTRAINT cc_flows_unique_flowid UNIQUE (flowid);


--
-- Name: closeddial_cd_idx1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.closeddial
    ADD CONSTRAINT closeddial_cd_idx1 UNIQUE (username, domain, cd_domain, cd_username, group_id);


--
-- Name: closeddial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.closeddial
    ADD CONSTRAINT closeddial_pkey PRIMARY KEY (id);


--
-- Name: clusterer_clusterer_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.clusterer
    ADD CONSTRAINT clusterer_clusterer_idx UNIQUE (cluster_id, node_id);


--
-- Name: clusterer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.clusterer
    ADD CONSTRAINT clusterer_pkey PRIMARY KEY (id);


--
-- Name: cpl_account_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cpl
    ADD CONSTRAINT cpl_account_idx UNIQUE (username, domain);


--
-- Name: cpl_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.cpl
    ADD CONSTRAINT cpl_pkey PRIMARY KEY (id);


--
-- Name: dbaliases_alias_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dbaliases
    ADD CONSTRAINT dbaliases_alias_idx UNIQUE (alias_username, alias_domain);


--
-- Name: dbaliases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dbaliases
    ADD CONSTRAINT dbaliases_pkey PRIMARY KEY (id);


--
-- Name: dialog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dialog
    ADD CONSTRAINT dialog_pkey PRIMARY KEY (dlg_id);


--
-- Name: dialplan_local_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY public.dialplan_local
    ADD CONSTRAINT dialplan_local_pkey PRIMARY KEY (id);


--
-- Name: dialplan_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY public.dialplan
    ADD CONSTRAINT dialplan_pkey PRIMARY KEY (id);


--
-- Name: dispatcher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dispatcher
    ADD CONSTRAINT dispatcher_pkey PRIMARY KEY (id);


--
-- Name: domain_domain_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.domain
    ADD CONSTRAINT domain_domain_idx UNIQUE (domain);


--
-- Name: domain_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.domain
    ADD CONSTRAINT domain_pkey PRIMARY KEY (id);


--
-- Name: domainpolicy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.domainpolicy
    ADD CONSTRAINT domainpolicy_pkey PRIMARY KEY (id);


--
-- Name: domainpolicy_rav_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.domainpolicy
    ADD CONSTRAINT domainpolicy_rav_idx UNIQUE (rule, att, val);


--
-- Name: dp_id_grp_key; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY public.dp_id
    ADD CONSTRAINT dp_id_grp_key UNIQUE (grp);


--
-- Name: dp_id_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY public.dp_id
    ADD CONSTRAINT dp_id_pkey PRIMARY KEY (id);


--
-- Name: dr_carriers_dr_carrier_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dr_carriers
    ADD CONSTRAINT dr_carriers_dr_carrier_idx UNIQUE (carrierid);


--
-- Name: dr_carriers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dr_carriers
    ADD CONSTRAINT dr_carriers_pkey PRIMARY KEY (id);


--
-- Name: dr_gateways_dr_gw_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dr_gateways
    ADD CONSTRAINT dr_gateways_dr_gw_idx UNIQUE (gwid);


--
-- Name: dr_gateways_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dr_gateways
    ADD CONSTRAINT dr_gateways_pkey PRIMARY KEY (id);


--
-- Name: dr_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dr_groups
    ADD CONSTRAINT dr_groups_pkey PRIMARY KEY (id);


--
-- Name: dr_partitions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dr_partitions
    ADD CONSTRAINT dr_partitions_pkey PRIMARY KEY (id);


--
-- Name: dr_rules_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.dr_rules
    ADD CONSTRAINT dr_rules_pkey PRIMARY KEY (ruleid);


--
-- Name: emergency_report_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.emergency_report
    ADD CONSTRAINT emergency_report_pkey PRIMARY KEY (id);


--
-- Name: emergency_routing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.emergency_routing
    ADD CONSTRAINT emergency_routing_pkey PRIMARY KEY (id);


--
-- Name: emergency_service_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.emergency_service_provider
    ADD CONSTRAINT emergency_service_provider_pkey PRIMARY KEY (id);


--
-- Name: fraud_detection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.fraud_detection
    ADD CONSTRAINT fraud_detection_pkey PRIMARY KEY (ruleid);


--
-- Name: freeswitch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.freeswitch
    ADD CONSTRAINT freeswitch_pkey PRIMARY KEY (id);


--
-- Name: globalblacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.globalblacklist
    ADD CONSTRAINT globalblacklist_pkey PRIMARY KEY (id);


--
-- Name: grp_account_group_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.grp
    ADD CONSTRAINT grp_account_group_idx UNIQUE (username, domain, grp);


--
-- Name: grp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.grp
    ADD CONSTRAINT grp_pkey PRIMARY KEY (id);


--
-- Name: imc_members_account_room_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.imc_members
    ADD CONSTRAINT imc_members_account_room_idx UNIQUE (username, domain, room);


--
-- Name: imc_members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.imc_members
    ADD CONSTRAINT imc_members_pkey PRIMARY KEY (id);


--
-- Name: imc_rooms_name_domain_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.imc_rooms
    ADD CONSTRAINT imc_rooms_name_domain_idx UNIQUE (name, domain);


--
-- Name: imc_rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.imc_rooms
    ADD CONSTRAINT imc_rooms_pkey PRIMARY KEY (id);


--
-- Name: load_balancer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.load_balancer
    ADD CONSTRAINT load_balancer_pkey PRIMARY KEY (id);


--
-- Name: location_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (contact_id);


--
-- Name: missed_calls_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.missed_calls
    ADD CONSTRAINT missed_calls_pkey PRIMARY KEY (id);


--
-- Name: networks_pkey; Type: CONSTRAINT; Schema: public; Owner: admin; Tablespace: 
--

ALTER TABLE ONLY public.networks
    ADD CONSTRAINT networks_pkey PRIMARY KEY (id);


--
-- Name: presentity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.presentity
    ADD CONSTRAINT presentity_pkey PRIMARY KEY (id);


--
-- Name: presentity_presentity_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.presentity
    ADD CONSTRAINT presentity_presentity_idx UNIQUE (username, domain, event, etag);


--
-- Name: pua_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.pua
    ADD CONSTRAINT pua_pkey PRIMARY KEY (id);


--
-- Name: re_grp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.re_grp
    ADD CONSTRAINT re_grp_pkey PRIMARY KEY (id);


--
-- Name: registrant_aor_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.registrant
    ADD CONSTRAINT registrant_aor_idx UNIQUE (aor);


--
-- Name: registrant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.registrant
    ADD CONSTRAINT registrant_pkey PRIMARY KEY (id);


--
-- Name: rls_presentity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.rls_presentity
    ADD CONSTRAINT rls_presentity_pkey PRIMARY KEY (id);


--
-- Name: rls_presentity_rls_presentity_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.rls_presentity
    ADD CONSTRAINT rls_presentity_rls_presentity_idx UNIQUE (rlsubs_did, resource_uri);


--
-- Name: rls_watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.rls_watchers
    ADD CONSTRAINT rls_watchers_pkey PRIMARY KEY (id);


--
-- Name: rls_watchers_rls_watcher_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.rls_watchers
    ADD CONSTRAINT rls_watchers_rls_watcher_idx UNIQUE (presentity_uri, callid, to_tag, from_tag);


--
-- Name: route_tree_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.route_tree
    ADD CONSTRAINT route_tree_pkey PRIMARY KEY (id);


--
-- Name: rtpengine_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.rtpengine
    ADD CONSTRAINT rtpengine_pkey PRIMARY KEY (id);


--
-- Name: rtpproxy_sockets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.rtpproxy_sockets
    ADD CONSTRAINT rtpproxy_sockets_pkey PRIMARY KEY (id);


--
-- Name: silo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.silo
    ADD CONSTRAINT silo_pkey PRIMARY KEY (id);


--
-- Name: sip_trace_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.sip_trace
    ADD CONSTRAINT sip_trace_pkey PRIMARY KEY (id);


--
-- Name: speed_dial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.speed_dial
    ADD CONSTRAINT speed_dial_pkey PRIMARY KEY (id);


--
-- Name: speed_dial_speed_dial_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.speed_dial
    ADD CONSTRAINT speed_dial_speed_dial_idx UNIQUE (username, domain, sd_domain, sd_username);


--
-- Name: subscriber_account_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_account_idx UNIQUE (username, domain);


--
-- Name: subscriber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.subscriber
    ADD CONSTRAINT subscriber_pkey PRIMARY KEY (id);


--
-- Name: tls_mgm_domain_type_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.tls_mgm
    ADD CONSTRAINT tls_mgm_domain_type_idx UNIQUE (domain, type);


--
-- Name: tls_mgm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.tls_mgm
    ADD CONSTRAINT tls_mgm_pkey PRIMARY KEY (id);


--
-- Name: uri_account_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.uri
    ADD CONSTRAINT uri_account_idx UNIQUE (username, domain, uri_user);


--
-- Name: uri_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.uri
    ADD CONSTRAINT uri_pkey PRIMARY KEY (id);


--
-- Name: userblacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.userblacklist
    ADD CONSTRAINT userblacklist_pkey PRIMARY KEY (id);


--
-- Name: usr_preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.usr_preferences
    ADD CONSTRAINT usr_preferences_pkey PRIMARY KEY (id);


--
-- Name: version_t_name_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.version
    ADD CONSTRAINT version_t_name_idx UNIQUE (table_name);


--
-- Name: watchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.watchers
    ADD CONSTRAINT watchers_pkey PRIMARY KEY (id);


--
-- Name: watchers_watcher_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.watchers
    ADD CONSTRAINT watchers_watcher_idx UNIQUE (presentity_uri, watcher_username, watcher_domain, event);


--
-- Name: xcap_account_doc_type_idx; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.xcap
    ADD CONSTRAINT xcap_account_doc_type_idx UNIQUE (username, domain, doc_type, doc_uri);


--
-- Name: xcap_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY public.xcap
    ADD CONSTRAINT xcap_pkey PRIMARY KEY (id);


--
-- Name: acc_callid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX acc_callid_idx ON public.acc USING btree (callid);


--
-- Name: b2b_entities_b2b_entities_param; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX b2b_entities_b2b_entities_param ON public.b2b_entities USING btree (param);


--
-- Name: cc_calls_b2buaid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX cc_calls_b2buaid_idx ON public.cc_calls USING btree (b2buaid);


--
-- Name: closeddial_cd_idx2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX closeddial_cd_idx2 ON public.closeddial USING btree (group_id);


--
-- Name: closeddial_cd_idx3; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX closeddial_cd_idx3 ON public.closeddial USING btree (cd_username);


--
-- Name: closeddial_cd_idx4; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX closeddial_cd_idx4 ON public.closeddial USING btree (username);


--
-- Name: dbaliases_target_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX dbaliases_target_idx ON public.dbaliases USING btree (username, domain);


--
-- Name: domainpolicy_rule_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX domainpolicy_rule_idx ON public.domainpolicy USING btree (rule);


--
-- Name: globalblacklist_globalblacklist_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX globalblacklist_globalblacklist_idx ON public.globalblacklist USING btree (prefix);


--
-- Name: load_balancer_dsturi_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX load_balancer_dsturi_idx ON public.load_balancer USING btree (dst_uri);


--
-- Name: missed_calls_callid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX missed_calls_callid_idx ON public.missed_calls USING btree (callid);


--
-- Name: pua_del1_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pua_del1_idx ON public.pua USING btree (pres_uri, event);


--
-- Name: pua_del2_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pua_del2_idx ON public.pua USING btree (expires);


--
-- Name: pua_update_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pua_update_idx ON public.pua USING btree (pres_uri, pres_id, flag, event);


--
-- Name: re_grp_group_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX re_grp_group_idx ON public.re_grp USING btree (group_id);


--
-- Name: rls_presentity_updated_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX rls_presentity_updated_idx ON public.rls_presentity USING btree (updated);


--
-- Name: silo_account_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX silo_account_idx ON public.silo USING btree (username, domain);


--
-- Name: sip_trace_callid_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sip_trace_callid_idx ON public.sip_trace USING btree (callid);


--
-- Name: sip_trace_date_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sip_trace_date_idx ON public.sip_trace USING btree (time_stamp);


--
-- Name: sip_trace_fromip_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sip_trace_fromip_idx ON public.sip_trace USING btree (from_ip);


--
-- Name: sip_trace_trace_attrs_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sip_trace_trace_attrs_idx ON public.sip_trace USING btree (trace_attrs);


--
-- Name: subscriber_username_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX subscriber_username_idx ON public.subscriber USING btree (username);


--
-- Name: userblacklist_userblacklist_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX userblacklist_userblacklist_idx ON public.userblacklist USING btree (username, domain, prefix);


--
-- Name: usr_preferences_ua_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX usr_preferences_ua_idx ON public.usr_preferences USING btree (uuid, attribute);


--
-- Name: usr_preferences_uda_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX usr_preferences_uda_idx ON public.usr_preferences USING btree (username, domain, attribute);


--
-- Name: usr_preferences_value_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX usr_preferences_value_idx ON public.usr_preferences USING btree (value);


--
-- Name: xcap_source_idx; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX xcap_source_idx ON public.xcap USING btree (source);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: TABLE dialplan; Type: ACL; Schema: public; Owner: admin
--

REVOKE ALL ON TABLE public.dialplan FROM PUBLIC;
REVOKE ALL ON TABLE public.dialplan FROM admin;
GRANT ALL ON TABLE public.dialplan TO admin;


--
-- PostgreSQL database dump complete
--

