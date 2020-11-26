----Exercicios trab03/05

/*Ex1*/
SELECT  TC.ID_CONTA, TC.NR_DIGITO_CONTA, TC.VL_SALDO, TB.NM_BANCO, TBA.NM_AGENCIA, TTC.NM_TIPO_CONTA  
FROM TAB_BANCO TB, TAB_BANCO_AGENCIA TBA, TAB_CONTA TC, TAB_TIPO_CONTA TTC, TAB_CORRENTISTA TCORR
WHERE TCORR.NM_NOME LIKE '%ADALTON ISIDORO%';

/*Ex2*/
select TM.NM_MUNICIPIO, TE.NM_UF
from TAB_MUNICIPIO TM JOIN TAB_ESTADO TE 
ON TM.ID_UF = TE.ID_UF 
ORDER BY TE.NM_UF;

/* Ex3*/
select TC.NM_NOME, TE.NM_UF, TC.DT_NASCIMENTO, TL.DS_TIPO, TL.NM_NOME, TC.NR_NUMERO
from TAB_CORRENTISTA TC JOIN TAB_MUNICIPIO TM
ON  TC.ID_MUNICIPIO = TM.ID_MUNICIPIO
            
JOIN TAB_LOGRADOURO TL ON TL.ID_CEP = TC.ID_CEP
AND TC.ID_CEP = TL.ID_CEP
JOIN TAB_ESTADO TE ON TE.ID_UF = TM.ID_UF
            
WHERE TC.DT_NASCIMENTO BETWEEN '01/01/71' AND '31/12/71';

/*Ex4*/
SELECT COUNT(ID_TIPO_CONTA) FROM TAB_CONTA WHERE VL_SALDO >= 100;
/*Ex5*/
SELECT TC.NR_NUMERO, TC.NM_NOME,  TB.NM_BANCO, TC.DT_NASCIMENTO, TCON.VL_SALDO, TL.NM_NOME, TBA.NR_ENDERECO
FROM TAB_CORRENTISTA TC JOIN TAB_CONTA TCON ON TC.ID_CORRENTISTA = TCON.ID_CORRENTISTA
JOIN TAB_BANCO_AGENCIA TBA ON TBA.ID_BANCO = TCON.ID_BANCO
JOIN TAB_LOGRADOURO TL ON TL.ID_CEP = TBA.ID_CEP
JOIN TAB_BANCO TB ON TB.ID_BANCO = TBA.ID_BANCO
AND TC.ID_CEP = TL.ID_CEP
WHERE TBA.NM_AGENCIA = 'MONTE MOR';
/*Ex6*/
SELECT TC.NM_NOME, TC.DT_NASCIMENTO, TL.NM_NOME, TC.NR_NUMERO, TC1.ID_CONTA, TC1.VL_SALDO, TC1.ID_TIPO_CONTA
FROM TAB_CORRENTISTA TC JOIN TAB_MUNICIPIO TM ON TC.ID_MUNICIPIO = TM.ID_MUNICIPIO
JOIN TAB_CONTA TC1 ON  TC1.ID_CORRENTISTA = TC.ID_CORRENTISTA
JOIN TAB_LOGRADOURO TL ON TL.ID_CEP = TC.ID_CEP 
WHERE TM.NM_MUNICIPIO = 'SAO PAULO';

/*Ex7*/
select cd_tipo_correntista,count(cd_tipo_correntista)
from tab_conta join tab_tipo_conta
on tab_conta.id_tipo_conta = tab_tipo_conta.id_tipo_conta
group by cd_tipo_correntista;

/*Ex10*/
select c.nm_nome, c.dt_nascimento, tab_conta.vl_saldo
from tab_correntista c join tab_conta
on ds_sexo = 'M' and tab_conta.vl_saldo > 115.00
join tab_banco_agencia
on tab_banco_agencia.nm_agencia = 'SAO CARLOS';

/*Ex8*/
select id_agencia, avg(vl_saldo)"media saldo", max(vl_saldo)"maior saldo", min(vl_saldo)"menor saldo", sum(vl_saldo)"soma saldo"
from tab_conta
group by id_agencia;

/*Ex9*/
select ds_sexo, count(nm_nome)
from tab_correntista
group by ds_sexo;

/*Ex11*/
select nm_banco, nm_agencia, id_conta, vl_saldo, tab_correntista.nm_nome, dt_nascimento
from tab_banco, tab_banco_agencia, tab_conta, tab_correntista, tab_tipo_conta, tab_municipio
where
tab_tipo_conta.nm_tipo_conta = 'CONTA CORRENTE' and
tab_correntista.DS_SEXO = 'M'and
tab_municipio.nm_municipio = 'UNIAO PAULISTA';

/*Ex12*/
select id_conta, nm_banco, nm_agencia, vl_saldo, tab_correntista.nm_nome
from tab_conta join tab_tipo_conta
on tab_tipo_conta.NM_TIPO_CONTA = 'CONTA CORRENTE'
join tab_banco
on tab_tipo_conta.NM_TIPO_CONTA = 'CONTA CORRENTE'
join tab_banco_agencia
on tab_tipo_conta.NM_TIPO_CONTA = 'CONTA CORRENTE'
join tab_correntista
on tab_tipo_conta.NM_TIPO_CONTA = 'CONTA CORRENTE';


____________________________________________________________________________________________________________________________________



/*exercicio 14*/ 
SELECT nm_agencia, nr_endereco, nm_municipio, nm_uf, l.nm_nome
from TAB_BANCO b JOIN TAB_BANCO_AGENCIA ba
ON b.nm_banco LIKE 'BANCO DO BRASIL S/A'
JOIN TAB_LOGRADOURO l
ON ba.id_cep = l.id_cep
JOIN TAB_MUNICIPIO m
ON m.id_municipio = l.id_municipio
JOIN TAB_ESTADO e
ON e.ID_UF = m.ID_UF;












