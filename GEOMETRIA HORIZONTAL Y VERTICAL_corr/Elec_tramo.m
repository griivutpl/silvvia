%%============================
global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end
%% EJECUTAR UNA SOLA VEZ
TRAEX = numel(Prox)-1
TRAMOS_EXISTENTES=sprintf('Existen %d tramos',TRAEX);
disp(TRAMOS_EXISTENTES)

tramo(TRAEX).k = []
tramo(TRAEX).jprom = []
tramo(TRAEX).rf = []

%%
NRO_TRAMO=input('Ingresar tramo de analisis : ')
Tramoi=Prox(NRO_TRAMO,1)
Tramof=Prox(NRO_TRAMO+1,1)
%VARIABLE X Y
latitud = vbo.channels(3).data;
longitud = vbo.channels(4).data;
%GRAFICA

Xt=longitud(Tramoi:Tramof,1);
yt=latitud(Tramoi:Tramof,1);
plot(Xt,yt,'red','LineWidth',3)
hold on
plot(longitud,latitud)

%%
xvari =Distancia(Tramoi:Tramof,1);
yvari =altura(Tramoi:Tramof,1);
fig = figure;
plot(xvari,yvari)
sgt = sgtitle('Pendiente del tramo','Color','red');
sgt.FontSize =15;
xlabel('x');
ylabel('y');
grid on
%%
%%
xvar =Xt;
yvar =yt;
fig = figure;
plot(xvar,yvar)
sgt = sgtitle('Tramo de analisis','Color','red');
sgt.FontSize =15;
xlabel('x');
ylabel('y');
grid on
%Pendiente
%% Carga de datos
velocidadH = vbo.channels(5).data;

velocidadV = vbo.channels(8).data;

distancia = vbo.channels(14).data;

altura = vbo.channels(7).data; 
%% Procesos 
% Proceso 1
PI1 = altura(Tramoi,1);
Pf1 = altura(Tramof,1);
PId1 = distancia(Tramoi,1);
Pfd1 = distancia(Tramof,1);
J = (Pf1-PI1)/(Pfd1-PId1)*100
% Proceso 2
Dvel = (velocidadV./velocidadH)*100;
JPf = Dvel (Tramoi:Tramof,1);
J2 = mean(JPf)

%Pendiente final 
Jprom= (J+J2)/2
Z=input('Esta de acuerdo con la Pendiente S/N: ','s')
q=Jprom
if Z == 's'
    Jprom=q
else Z = 'N'
  Jprom=input('INGRESE LA PENDIENTE EN %')
end

