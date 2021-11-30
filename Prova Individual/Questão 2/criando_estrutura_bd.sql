//// -- Tables and References

Table TBInstituicao{
  ID_Instituicao int [pk, increment, unique] // auto-increment
  Cod_Categoria int
  Cod_OrganizacaoAcademica int
  Cod_AreaDoCurso int
  Cod_Curso int
  Cod_Modalidade boolean
} 


Table TBEstudante{
  ID_Estudante int [pk, increment, unique] // auto-increment
  NR_Idade INT
  DS_Sexo varchar(100)
  AnoConclusaoEnsinoMedio INT
  AnoInicioGraduacao INT
  DS_Turno varchar(100)
  B_InscricaoAdm boolean
  B_Concluinte boolean
}

Table TBTipoPresenca{
  ID_TipoPresenca int [pk, increment, unique] // auto-increment
  Cod_Enade int
  Cod_Prova int
  Cod_ObjetivaGeral INT
  Cod_DiscursivaGeral INT
  Cod_ObjetivaEspecifico INT
  Cod_DiscursivaEspecifico INT
} 

Table TBNota{
  ID_Nota INT [pk, increment, unique] // auto-increment
  NR_BrutaProva decimal
  NR_BrutaGeral decimal
  NR_BrutaObjetivaGeral decimal
  NR_BrutaDiscursivaGeral decimal
  NR_Q1_Geral decimal
  NR_LP_Q1_DiscursivaGeral decimal
  NR_Conteudo_Q1_DiscursivaGeral decimal
  NR_Q2_Geral decimal
  NR_LP_Q2_DiscursivaGeral decimal
  NR_Conteudo_Q2_DiscursivaGeral decimal
  NR_BrutaComponenteEspecifico decimal
  NR_BrutaObjetivaEspecifico decimal
  NR_BrutaDiscursivaEspecifico decimal
  NR_Q1_DiscursivaEspecifico decimal
  NR_Q2_DiscursivaEspecifico decimal
  NR_Q3_DiscursivaEspecifico decimal
  
}

Table QuestionarioProva{
  ID_QuestionarioProva INT [pk, increment, unique] // auto-increment
  RS_I1 varchar(1)
  RS_I2 varchar(1)
  RS_I3 varchar(1)
  RS_I4 varchar(1)
  RS_I5 varchar(1)
  RS_I6 varchar(1)
  RS_I7 varchar(1)
  RS_I8 varchar(1)
  RS_I9 varchar(1)
}

Table TBUF{
  ID_UF INT [pk, increment, unique] // auto-increment
  DS_UF varchar(3)
}

Table QuestionarioEstudante{
  ID_QuestionarioEstudante INT [pk, increment, unique] // auto-increment
  QE_I01 varchar(1)
  QE_I02 varchar(1)
  QE_I03 varchar(1)
  QE_I04 varchar(1)
  QE_I05 varchar(1)
  QE_I06 varchar(1)
  QE_I07 varchar(1)
  QE_I08 varchar(1)
  QE_I09 varchar(1)
  QE_I10 varchar(1)
  QE_I11 varchar(1)
  QE_I12 varchar(1)
  QE_I13 varchar(1)
  QE_I14 varchar(1)
  QE_I15 varchar(1)
  QE_I16 varchar(1)
  QE_I17 varchar(1)
  QE_I18 varchar(1)
  QE_I19 varchar(1)
  QE_I20 varchar(1)
  QE_I21 varchar(1)
  QE_I22 varchar(1)
  QE_I23 varchar(1)
  QE_I24 varchar(1)
  QE_I25 varchar(1)
  QE_I26 varchar(1)
}

Table TBMunicipio {
  ID_Municipio int [pk, increment, unique]
  DS_Nome varchar(200) 
  Cod_Municipio INT [unique]
 }
Table TBRegiao {
  ID_Regiao int [pk, increment, unique]
  DS_Nome varchar(200) 
}

Table TBGrauConcordanciaAluno{
  ID_GrauConcordanciaAluno int [pk, increment, unique]
  QE_I27 INT
  QE_I28 INT
  QE_I29 INT
  QE_I30 INT
  QE_I31 INT
  QE_I32 INT
  QE_I33 INT
  QE_I34 INT
  QE_I35 INT
  QE_I36 INT
  QE_I37 INT
  QE_I38 INT
  QE_I39 INT
  QE_I40 INT
  QE_I41 INT
  QE_I42 INT
  QE_I43 INT
  QE_I44 INT
  QE_I45 INT
  QE_I46 INT
  QE_I47 INT
  QE_I48 INT
  QE_I49 INT
  QE_I50 INT
  QE_I51 INT
  QE_I52 INT
  QE_I53 INT
  QE_I54 INT
  QE_I55 INT
  QE_I56 INT
  QE_I57 INT
  QE_I58 INT
  QE_I59 INT
  QE_I60 INT
  QE_I61 INT
  QE_I62 INT
  QE_I63 INT
  QE_I64 INT
  QE_I65 INT
  QE_I66 INT
  QE_I67 INT
  QE_I68 INT
}
  

Table Dados{
  ID_Dados INT [pk, increment, unique] // auto-increment
  NR_Ano INT
  FK_SQ_Instituicao INT
  FK_SQ_Municipio INT
  FK_SQ_UF INT
  FK_SQ_Regiao INT
  FK_SQ_TipoPresenca INT
  FK_SQ_Estudante INT
  FK_SQ_Nota INT
  FK_SQ_QuestionarioProva INT
  FK_SQ_QuestionarioEstudante INT
  FK_SQ_GrauConcordanciaAluno INT
}

Ref: "Dados"."FK_SQ_Instituicao" - "TBInstituicao"."ID_Instituicao"
Ref: "TBRegiao"."ID_Regiao" < "Dados"."FK_SQ_Regiao"
Ref: "TBMunicipio"."ID_Municipio" < "Dados"."FK_SQ_Municipio"
Ref: "TBTipoPresenca"."ID_TipoPresenca" < "Dados"."FK_SQ_TipoPresenca"
Ref: "TBEstudante"."ID_Estudante" < "Dados"."FK_SQ_Estudante"
Ref: "TBNota"."ID_Nota" < "Dados"."FK_SQ_Nota"
Ref: "QuestionarioEstudante"."ID_QuestionarioEstudante" < "Dados"."FK_SQ_QuestionarioEstudante"
Ref: "QuestionarioProva"."ID_QuestionarioProva" < "Dados"."FK_SQ_QuestionarioProva"
Ref: "Dados"."FK_SQ_GrauConcordanciaAluno" - "TBGrauConcordanciaAluno"."ID_GrauConcordanciaAluno"
Ref: "Dados"."FK_SQ_UF" - "TBUF"."ID_UF"
