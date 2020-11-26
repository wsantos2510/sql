drop table TAB_CONTA;
drop table TAB_BANCO_AGENCIA;
drop table TAB_CORRENTISTA;
drop table TAB_TIPO_CONTA;
drop table TAB_LOGRADOURO;
drop table TAB_MUNICIPIO;
drop table TAB_ESTADO;
drop table TAB_BANCO;
drop view teste;

CREATE TABLE TAB_BANCO (
       ID_BANCO             NUMBER(6) NOT NULL,
       NM_BANCO             VARCHAR2(60) NOT NULL
);


ALTER TABLE TAB_BANCO
       ADD  ( PRIMARY KEY (ID_BANCO) ) ;

CREATE TABLE TAB_BANCO_AGENCIA (
       ID_BANCO             NUMBER(6) NOT NULL,
       ID_AGENCIA           NUMBER(6) NOT NULL,
       NM_AGENCIA           VARCHAR2(60) NULL,
       NR_DIG_AGENCIA       NUMBER(2) NOT NULL,
       ID_CEP               CHAR(8) NOT NULL,
       NR_ENDERECO          VARCHAR2(15) NOT NULL
);


ALTER TABLE TAB_BANCO_AGENCIA
       ADD  ( PRIMARY KEY (ID_BANCO, ID_AGENCIA) ) ;


CREATE TABLE TAB_CONTA (
       ID_CORRENTISTA       NUMBER(12) NOT NULL,
       ID_BANCO             NUMBER(6) NOT NULL,
       ID_CONTA             VARCHAR2(10) NOT NULL,
       ID_AGENCIA           NUMBER(6) NOT NULL,
       NR_DIGITO_CONTA      CHAR(1) NOT NULL,
       CD_TIPO_CORRENTISTA  CHAR(1) NOT NULL,
       ID_TIPO_CONTA        NUMBER(6) NOT NULL,
       VL_SALDO             DECIMAL(12,2) NOT NULL
);


ALTER TABLE TAB_CONTA
       ADD  ( PRIMARY KEY (ID_CORRENTISTA, ID_BANCO, ID_CONTA, 
              ID_AGENCIA) ) ;


CREATE TABLE TAB_CORRENTISTA (
       ID_CORRENTISTA       NUMBER(12) NOT NULL,
       NM_NOME              VARCHAR2(90) NOT NULL,
       DT_NASCIMENTO        DATE NOT NULL,
       ID_MUNICIPIO         NUMBER(6) NOT NULL,
       DS_SEXO              CHAR(1) NOT NULL,
       ID_CEP               CHAR(8) NOT NULL,
       NR_NUMERO            VARCHAR2(15) NOT NULL
);


ALTER TABLE TAB_CORRENTISTA
       ADD  ( PRIMARY KEY (ID_CORRENTISTA) ) ;


CREATE TABLE TAB_ESTADO (
       ID_UF                CHAR(2) NOT NULL,
       NM_UF                VARCHAR2(60) NOT NULL
);


ALTER TABLE TAB_ESTADO
       ADD  ( PRIMARY KEY (ID_UF) ) ;


CREATE TABLE TAB_LOGRADOURO (
       ID_CEP               CHAR(8) NOT NULL,
       ID_MUNICIPIO         NUMBER(6) NOT NULL,
       DS_TIPO              VARCHAR2(20) NULL,
       DS_TITULO            VARCHAR2(20) NULL,
       NM_NOME              VARCHAR2(100) NOT NULL

);


ALTER TABLE TAB_LOGRADOURO
       ADD  ( PRIMARY KEY (ID_CEP) ) ;


CREATE TABLE TAB_MUNICIPIO (
       ID_MUNICIPIO         NUMBER(6) NOT NULL,
       ID_UF                CHAR(2) NOT NULL,
       NM_MUNICIPIO         VARCHAR2(60) NOT NULL
);


ALTER TABLE TAB_MUNICIPIO
       ADD  ( PRIMARY KEY (ID_MUNICIPIO) ) ;


CREATE TABLE TAB_TIPO_CONTA (
       ID_TIPO_CONTA        NUMBER(6) NOT NULL,
       NM_TIPO_CONTA        VARCHAR2(60) NULL
);


ALTER TABLE TAB_TIPO_CONTA
       ADD  ( PRIMARY KEY (ID_TIPO_CONTA) ) ;


ALTER TABLE TAB_BANCO_AGENCIA
       ADD  ( FOREIGN KEY (ID_BANCO)
                             REFERENCES TAB_BANCO ) ;

                             
--ALTER TABLE TAB_BANCO_AGENCIA
--       ADD  ( FOREIGN KEY (ID_CEP)
--                             REFERENCES TAB_LOGRADOURO(ID_CEP) ) ;


ALTER TABLE TAB_CONTA
       ADD  ( FOREIGN KEY (ID_BANCO, ID_AGENCIA)
                             REFERENCES TAB_BANCO_AGENCIA ) ;


ALTER TABLE TAB_CONTA
       ADD  ( FOREIGN KEY (ID_TIPO_CONTA)
                             REFERENCES TAB_TIPO_CONTA ) ;


ALTER TABLE TAB_CONTA
       ADD  ( FOREIGN KEY (ID_CORRENTISTA)
                             REFERENCES TAB_CORRENTISTA ) ;


ALTER TABLE TAB_CONTA
       ADD  ( FOREIGN KEY (ID_BANCO)
                             REFERENCES TAB_BANCO ) ;


ALTER TABLE TAB_CORRENTISTA
       ADD  ( FOREIGN KEY (ID_MUNICIPIO)
                             REFERENCES TAB_MUNICIPIO ) ;


ALTER TABLE TAB_CORRENTISTA
       ADD  ( FOREIGN KEY (ID_CEP)
                             REFERENCES TAB_LOGRADOURO ) ;


ALTER TABLE TAB_LOGRADOURO
       ADD  ( FOREIGN KEY (ID_MUNICIPIO)
                             REFERENCES TAB_MUNICIPIO ) ;


ALTER TABLE TAB_MUNICIPIO
       ADD  ( FOREIGN KEY (ID_UF)
                             REFERENCES TAB_ESTADO ) ;


