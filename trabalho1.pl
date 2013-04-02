%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SIST. REPR. CONHECIMENTO E RACIOCINIO - LEI/2013

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% TRABALHO DE GRUPO - EXERCÍCIO 1

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Base de Conhecimento com informacão relativa a uma árvore genealógica familiar.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariantes

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic filho/2.
:- dynamic pai/2.

% Invariante Estrutural:  nao permitir a insercao de conhecimento repetido


% Invariante Referencial: nao admitir mais do que 2 progenitores
%                         para um mesmo individuo


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado filho: Filho,Pai -> {V,F}

filho( F,P ) :- pai( P,F ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado pai: Pai,Filho -> {V,F}

pai( P,F ) :- filho( F,P ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado tio: Tio,Sobrinho -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado sobrinho: Sobrinho,Tio -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado primo: Primo,Primo -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado irmao: Irmao,Irmao -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado avo: Avo,Neto -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado neto: Neto,Avo -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisavo: Bisavo,Bisneto -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado bisneto: Bisneto,Bisavo -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente -> {V,F}

descendente(D,A) :- filho(D,A);filho(D,N),descendente(A,N).

% desdendente(D,A) :- ascendente(A,D).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado descendente: Descendente,Ascendente,Grau -> {V,F}

descendente(D,A,1) :- filho(D,A).
descendente(D,A,Z) :- filho(D,N);descendente(N,A,G), Z is G+1.

% descendente (D,A,Z) :- ascendente (A,D,Z).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendente: Ascendente,Descendente -> {V,F}

ascendente(A,D) :- descendente(D,A).

% ascendente(A,D) :- filho(D,A);filho(D,N),ascendente(A,N).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado ascendente: Ascendente,Descendente,Grau -> {V,F}

ascendente(A,D,Z) :- descendente(D,A,Z).

% ascendente(A,D,1) :- filho(D,A).
% ascendente(A,D,Z) :- filho(D,N);ascendente(A,N,G), Z is G+1.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado natural: Individuo,Local -> {V,F}


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a evolucao do conhecimento


