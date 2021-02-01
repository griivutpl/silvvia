%%global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end
%%
%%
k=exist('RF')
if k==1
    l=('curva')
else k=0 
    RF=99999999
    l=('Recta')
end


%%
%% ALMACENAMIENTO POR CADA TRAMO
% Ejecutar cuando ya se tenga la información de k, Jprom, RF
tramo(NRO_TRAMO).k = k
tramo(NRO_TRAMO).jprom = Jprom
tramo(NRO_TRAMO).rf = RF


%% VISUALIZACIÓN DE INFORMACIÓN
% Visualiza todos los valores de k
tramo.k

% Visualiza todos los valroes de Jprom
tramo.jprom

% Visualiza todos los valores de rf
tramo.rf

% En el caso de querer visualizar uno de los tramos deben escribir entre
% parentesis el valor solicitado. Ej

tramo(1).k 
tramo(1).jprom
tramo(1).rf


