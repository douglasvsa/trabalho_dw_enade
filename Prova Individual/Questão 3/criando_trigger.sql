-- criando trigger 

create trigger TBEstudante_TR_ON_INSERT
	after insert
	on TBEstudante
	for each row
	BEGIN

    DECLARE IDSQNota INT;
    DECLARE IDSQGrauConcordanciaAluno INT;
    DECLARE IDSQQuestionarioEstudante INT;
    DECLARE IDSQQuestionarioProva INT;
    DECLARE IDSQInstituicao INT;
    DECLARE IDSQTipoPresenca INT;
    DECLARE ORGACAD INT;
    DECLARE CATEGAD INT;
    DECLARE GRUPO INT;
    DECLARE CURSO INT;
    DECLARE MODALIDADE INT;
    DECLARE PRES INT;
    DECLARE PR_GER INT;
    DECLARE PR_OB_FG INT;
    DECLARE PR_DI_FG INT;
    DECLARE PR_OB_CE INT;
    DECLARE PR_DI_CE INT;


    select
        
        CO_ORGACAD
         ,CO_CATEGAD
         ,CO_GRUPO
         ,CO_CURSO
         ,CO_MODALIDADE
         , TP_PRES
         ,TP_PR_GER
         ,TP_PR_OB_FG
         ,TP_PR_DI_FG
         ,TP_PR_OB_CE
         ,TP_PR_DI_CE
    INTO
        ORGACAD
        ,CATEGAD
        ,GRUPO
        ,CURSO
        ,MODALIDADE
        ,PRES
        ,PR_GER
        ,PR_OB_FG
        ,PR_DI_FG
        ,PR_OB_CE
        ,PR_DI_CE
    FROM tabela_aux
    WHERE id_aux = NEW.ID_Estudante;

    SET IDSQInstituicao = (
        SELECT ID_Instituicao
        FROM TBInstituicao
        WHERE Cod_OrganizacaoAcademica = ORGACAD
            AND Cod_Categoria = CATEGAD
            AND Cod_AreaDoCurso = GRUPO
            AND Cod_Curso = CURSO
            AND Cod_Modalidade = MODALIDADE
        LIMIT 1 
    );

    SET IDSQTipoPresenca = (
            SELECT ID_TipoPresenca
            FROM TBTipoPresenca
            WHERE Cod_Enade = PRES
                AND Cod_Prova = PR_GER
                AND Cod_ObjetivaGeral = PR_OB_FG
                AND Cod_DiscursivaGeral = PR_DI_FG
                AND Cod_ObjetivaEspecifico = PR_OB_CE
                AND Cod_DiscursivaEspecifico = PR_DI_CE
            LIMIT 1 
        );

    -- Não pode ser único
    INSERT INTO QuestionarioProva(RS_I1, RS_I2, RS_I3, RS_I4, RS_I5, RS_I6, RS_I7, RS_I8, RS_I9)
    SELECT CO_RS_I1,CO_RS_I2,CO_RS_I3,CO_RS_I4,CO_RS_I5,CO_RS_I6,CO_RS_I7,CO_RS_I8,CO_RS_I9
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;

    SET IDSQQuestionarioProva = LAST_INSERT_ID();

    -- Não pode ser único
    INSERT INTO QuestionarioEstudante(QE_I01, QE_I02, QE_I03, QE_I04, QE_I05, QE_I06, QE_I07, QE_I08, QE_I09, QE_I10, QE_I11, QE_I12, QE_I13, QE_I14, QE_I15, QE_I16, QE_I17, QE_I18, QE_I19, QE_I20, QE_I21, QE_I22, QE_I23, QE_I24, QE_I25, QE_I26)
    SELECT
        QE_I01
         , QE_I02
         , QE_I03
         , QE_I04
         , QE_I05
         , QE_I06
         , QE_I07
         , QE_I08
         , QE_I09
         , QE_I10
         , QE_I11
         , QE_I12
         , QE_I13
         , QE_I14
         , QE_I15
         , IF(QE_I16 = '', NULL,QE_I16)
         , QE_I17
         , QE_I18
         , QE_I19
         , QE_I20
         , QE_I21
         , QE_I22
         , QE_I23
         , QE_I24
         , QE_I25
         , QE_I26
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;

    SET IDSQQuestionarioEstudante = LAST_INSERT_ID();

    -- Não pode ser único
    INSERT INTO TBGrauConcordanciaAluno(QE_I27, QE_I28, QE_I29, QE_I30, QE_I31, QE_I32, QE_I33, QE_I34, QE_I35, QE_I36, QE_I37, QE_I38, QE_I39, QE_I40, QE_I41, QE_I42, QE_I43, QE_I44, QE_I45, QE_I46, QE_I47, QE_I48, QE_I49, QE_I50, QE_I51, QE_I52, QE_I53, QE_I54, QE_I55, QE_I56, QE_I57, QE_I58, QE_I59, QE_I60, QE_I61, QE_I62, QE_I63, QE_I64, QE_I65, QE_I66, QE_I67, QE_I68)
    SELECT if(QE_I27 = '',NULL,QE_I27)
         , if(QE_I28 = '',NULL,QE_I28)
         , if(QE_I29 = '',NULL,QE_I29)
         , if(QE_I30 = '',NULL,QE_I30)
         , if(QE_I31 = '',NULL,QE_I31)
         , if(QE_I32 = '',NULL,QE_I32)
         , if(QE_I33 = '',NULL,QE_I33)
         , if(QE_I34 = '',NULL,QE_I34)
         , if(QE_I35 = '',NULL,QE_I35)
         , if(QE_I36 = '',NULL,QE_I36)
         , if(QE_I37 = '',NULL,QE_I37)
         , if(QE_I38 = '',NULL,QE_I38)
         , if(QE_I39 = '',NULL,QE_I39)
         , if(QE_I40 = '',NULL,QE_I40)
         , if(QE_I41 = '',NULL,QE_I41)
         , if(QE_I42 = '',NULL,QE_I42)
         , if(QE_I43 = '',NULL,QE_I43)
         , if(QE_I44 = '',NULL,QE_I44)
         , if(QE_I45 = '',NULL,QE_I45)
         , if(QE_I46 = '',NULL,QE_I46)
         , if(QE_I47 = '',NULL,QE_I47)
         , if(QE_I48 = '',NULL,QE_I48)
         , if(QE_I49 = '',NULL,QE_I49)
         , if(QE_I50 = '',NULL,QE_I50)
         , if(QE_I51 = '',NULL,QE_I51)
         , if(QE_I52 = '',NULL,QE_I52)
         , if(QE_I53 = '',NULL,QE_I53)
         , if(QE_I54 = '',NULL,QE_I54)
         , if(QE_I55 = '',NULL,QE_I55)
         , if(QE_I56 = '',NULL,QE_I56)
         , if(QE_I57 = '',NULL,QE_I57)
         , if(QE_I58 = '',NULL,QE_I58)
         , if(QE_I59 = '',NULL,QE_I59)
         , if(QE_I60 = '',NULL,QE_I60)
         , if(QE_I61 = '',NULL,QE_I61)
         , if(QE_I62 = '',NULL,QE_I62)
         , if(QE_I63 = '',NULL,QE_I63)
         , if(QE_I64 = '',NULL,QE_I64)
         , if(QE_I65 = '',NULL,QE_I65)
         , if(QE_I66 = '',NULL,QE_I66)
         , if(QE_I67 = '',NULL,QE_I67)
         , if(QE_I68 = '',NULL,QE_I68)
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;

    SET IDSQGrauConcordanciaAluno = LAST_INSERT_ID();

    -- Não pode ser único
    insert into TBNota(
          NR_BrutaProva
        , NR_BrutaGeral
        , NR_BrutaObjetivaGeral
        , NR_BrutaDiscursivaGeral
        , NR_Q1_Geral
        , NR_LP_Q1_DiscursivaGeral
        , NR_Conteudo_Q1_DiscursivaGeral
        , NR_Q2_Geral
        , NR_LP_Q2_DiscursivaGeral
        , NR_Conteudo_Q2_DiscursivaGeral
        , NR_BrutaComponenteEspecifico
        , NR_BrutaObjetivaEspecifico
        , NR_BrutaDiscursivaEspecifico
        , NR_Q1_DiscursivaEspecifico
        , NR_Q2_DiscursivaEspecifico
        , NR_Q3_DiscursivaEspecifico)
    SELECT IF(NT_GER = '',NULL, REPLACE(NT_GER,',','.')),
           IF(NT_FG = '',NULL, REPLACE(NT_FG,',','.')),
           IF(NT_OBJ_FG = '',NULL, REPLACE(NT_OBJ_FG,',','.')),
           IF(NT_DIS_FG = '',NULL, REPLACE(NT_DIS_FG,',','.')),
           IF(NT_FG_D1 = '',NULL, REPLACE(NT_FG_D1,',','.')),
           IF(NT_FG_D1_PT = '',NULL, REPLACE(NT_FG_D1_PT,',','.')),
           IF(NT_FG_D1_CT = '',NULL, REPLACE(NT_FG_D1_CT,',','.')),
           IF(NT_FG_D2 = '',NULL, REPLACE(NT_FG_D2,',','.')),
           IF(NT_FG_D2_PT = '',NULL, REPLACE(NT_FG_D2_PT,',','.')),
           IF(NT_FG_D2_CT = '',NULL, REPLACE(NT_FG_D2_CT,',','.')),
           IF(NT_CE = '',NULL, REPLACE(NT_CE,',','.')),
           IF(NT_OBJ_CE = '',NULL, REPLACE(NT_OBJ_CE,',','.')),
           IF(NT_DIS_CE = '',NULL, REPLACE(NT_DIS_CE,',','.')),
           IF(NT_CE_D1 = '',NULL, REPLACE(NT_CE_D1,',','.')),
           IF(NT_CE_D2 = '',NULL, REPLACE(NT_CE_D2,',','.')),
           IF(NT_CE_D3 = '',NULL, REPLACE(NT_CE_D3,',','.'))
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;

    SET IDSQNota = LAST_INSERT_ID();

    -- Não pode ser único
    insert into Dados(NR_Ano
    , FK_SQ_Instituicao
    , FK_SQ_Municipio
    , FK_SQ_UF
    , FK_SQ_Regiao
    , FK_SQ_TipoPresenca
    , FK_SQ_Estudante
    , FK_SQ_Nota
    , FK_SQ_QuestionarioProva
    , FK_SQ_QuestionarioEstudante
    , FK_SQ_GrauConcordanciaAluno)
    SELECT NU_ANO
         ,IDSQInstituicao
         ,CO_MUNIC_CURSO
         ,CO_UF_CURSO
         ,CO_REGIAO_CURSO
         ,IDSQTipoPresenca
         ,NEW.ID_Estudante
         ,IDSQNota
         ,IDSQQuestionarioProva
         ,IDSQQuestionarioEstudante
         ,IDSQGrauConcordanciaAluno
    from tabela_aux WHERE id_aux = NEW.ID_Estudante;


    END;
