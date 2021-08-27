function [Reduccion_total_MGL,Reduccion_total_MGL1,Reduccion_total_MGL2,Reduccion_total_MGL3,Reduccion_total_MGL4,Reduccion_total_MGL5,Reduccion_total_MGL6,Reduccion_total_MGL7,Reduccion_total_MGL8,Reduccion_total_MGL9,Reduccion_total_MGL10,Reduccion_total_MGL11,Reduccion_total_MGL12,Reduccion_total_MGL13,Reduccion_total_MGL14,Reduccion_total_MGL15,Reduccion_total_MGL16,Reduccion_total_MGL17,Reduccion_total_MGL18,Reduccion_total_MGL19]=calculo_MLG(x,y,MLG)

%Ocupante de vehículo
%----Salida de camino------Lado del conductor
%Factores de los atributos codificados
%Ancho de carril
tipoare=x(38);
anchocarri=x(13);
if tipoare==1 && anchocarri==0 %No aplicada contramedida
   anchocarril=0;
elseif tipoare==1 && anchocarri==1 %Ancho (≥ 3,25 m)
   anchocarril=1;
elseif tipoare==1 && anchocarri==2 %Medio (≥ 2,75 m a < 3,25 m)
   anchocarril=1.2;
elseif tipoare==1 && anchocarri==3 %Estrecho (≥ 0 m a < 2,75 m)
   anchocarril=1.5;
elseif tipoare==2 && anchocarri==0 %No aplicada contramedida
   anchocarril=0;
elseif tipoare==2 && anchocarri==1 %Ancho (≥ 3,25 m)
   anchocarril=1;
elseif tipoare==2 && anchocarri==2 %Medio (≥ 2,75 m a < 3,25 m)
   anchocarril=1.05;
else tipoare==2 && anchocarri==3 %Estrecho (≥ 0 m a < 2,75 m)
   anchocarril=1.1;
end
%Curvatura
T2=[1 1 1 1;1.8 2 2 1.8;3.5 3.8 3.8 3.5;6 6.5 6.5 6];
curvatur=x(14);
if curvatur==0 %No aplicada contramedida
    curvatura=0;
end
if curvatur==1 %Recto o ligeramente curvado
    for i=1:4
curvatura(1,i)=T2(1,i);
    end
end
if curvatur==2 %Moderado
    for i=1:4
curvatura(1,i)=T2(2,i);
    end
end
if curvatur==3 %Cerrada
    for i=1:4
curvatura(1,i)=T2(3,i);
    end
end
if curvatur==4 %Muy cerrada
    for i=1:4
curvatura(1,i)=T2(4,i);
    end
end
if curvatur==0
     curvatura2=0;
elseif curvatur==1
     curvatura2=curvatura(1,1);
elseif curvatur==2
        curvatura2=curvatura(1,1);
elseif curvatur==3
        curvatura2=curvatura(1,1);
else curvatur==4
      curvatura2=curvatura(1,1);
end

%Calidad de la curva
T3=[1 1 1 1;1.25 1.4 1.25 1.4;1 1 1 1];
calidadcurv=x(15);
if calidadcurv==0 %No aplicada contramedida
    calidadcurva=0;
end
if calidadcurv==1 %Adecuada
    for i=1:4
    calidadcurva(1,i)=T3(1,i);
    end
end
if calidadcurv==2 %Deficiente
    for i=1:4
    calidadcurva(1,i)=T3(2,i);
    end
end
if calidadcurv==3 %No aplica
    for i=1:4
    calidadcurva(1,i)=T3(3,i);
    end
end
if calidadcurv==0
     calidadcurva2=0;
elseif calidadcurv==1
    calidadcurva2=calidadcurva(1,1);
elseif calidadcurv==2
    calidadcurva2=calidadcurva(1,1);
else calidadcurv==3
    calidadcurva2=calidadcurva(1,1);
end
%Delineación
delineacio=x(19);
if delineacio==0 %No aplicada contramedida
    delineacion=0;
elseif delineacio==1 %Adecuada
    delineacion=1;
else delineacio==2 %Deficiente
    delineacion=1.2;
end
%Bandas sonoras en el espaldón
bandasonorae=x(5);
if bandasonorae==0 %No aplicada contramedida
    bandasonoraes=0;
elseif bandasonorae==1 %Ausente
    bandasonoraes=1.25;
else bandasonorae==2 %Presente
    bandasonoraes=1;
end

%Estado de la superficie de la vía
T6=[1 1 1 1 1;1.2 1.25 1.2 1.2 1.25;1.4 1.5 1.4 1.4 1.5];
estadosuperfici=x(17);
if estadosuperfici==0 %%No aplicada contramedida
    estadosuperficie=0;
end
if estadosuperfici==1 %Buena
    for i=1:5
    estadosuperficie(1,i)=T6(1,i);
    end
end
if estadosuperfici==2 %Regular
    for i=1:5
    estadosuperficie(1,i)=T6(2,i);
    end
end    
if estadosuperfici==3 %Mala
    for i=1:5
    estadosuperficie(1,i)=T6(3,i);
    end
end
if estadosuperfici==0
    estadosuperficie2=0;
elseif estadosuperfici==1
    estadosuperficie2=estadosuperficie(1,1);
elseif estadosuperfici==2
    estadosuperficie2=estadosuperficie(1,1);
else estadosuperfici==3
    estadosuperficie2=estadosuperficie(1,1);
end
%Pendiente
pendient=x(16);%No aplicada contramedida
if pendient==0 % 
   pendiente=0;
elseif pendient==3 %≥ 10 
   pendiente=1.7;
elseif pendient==2 %7,5  a 10 
   pendiente=1.2
else pendient==1 %0 % a < 7,5 %
   pendiente=1
end
%Resistencia al deslizamiento
T8=[1 1 1 1;1.4 1.6 1.4 1.6;2 2.5 2 2.5;3 4 3 4;5.5 7.5 5.5 7.5];
resdeslizamient=x(18);
if resdeslizamient==0 %Pavimentado - adecuado
   resdeslizamiento=0; 
end
if resdeslizamient==1 %Pavimentado - adecuado
    for i=1:4
   resdeslizamiento(1,i)=T8(1,i);  
    end
end
if resdeslizamient==2 %Pavimentado - regular
    for i=1:4
   resdeslizamiento(1,i)=T8(2,i);
   end
end
if resdeslizamient==3 %Pavimentado – pobre
    for i=1:4
   resdeslizamiento(1,i)=T8(3,i);
   end
end
if resdeslizamient==4 %Sin Pavimentar – adecuado
    for i=1:4
   resdeslizamiento(1,i)=T8(4,i);
   end
end
if resdeslizamient==5 %Sin Pavimentar - pobre
    for i=1:4
   resdeslizamiento(1,i)=T8(5,i);
   end
end
if resdeslizamient==0
   resdeslizamiento2=0;
elseif resdeslizamient==1
   resdeslizamiento2=resdeslizamiento(1,1);
elseif resdeslizamient==2
   resdeslizamiento2=resdeslizamiento(1,1);
elseif resdeslizamient==3
   resdeslizamiento2=resdeslizamiento(1,1);
elseif resdeslizamient==4
   resdeslizamiento2=resdeslizamiento(1,1);
else resdeslizamient==5
   resdeslizamiento2=resdeslizamiento(1,1);
end

%Severidad en la carretera: distancia del lado del conductor
T9=[1 1 1;0.8 0.8 0.6;0.35 0.35 0.1;0.1 0.1 0.01];
distconducto=x(1);
if distconducto==0 %No aplica contramedida
  distconductor=0;
end
if distconducto==1 %0 a < 1 m
    for i=1:3
  distconductor(1,i)=T9(1,i);
    end
end
if distconducto==2 %1 a < 5 m
    for i=1:3
  distconductor(1,i)=T9(2,i);
    end
end
if distconducto==3 %5 a < 10 m
    for i=1:3
  distconductor(1,i)=T9(3,i);
    end
end
if distconducto==4 %≥ 10 m
    for i=1:3
  distconductor(1,i)=T9(4,i);
    end
end
if distconducto==0
  distconductor2=0;
elseif distconducto==1
  distconductor2=distconductor(1,1);
elseif distconducto==2
  distconductor2=distconductor(1,1);
elseif distconducto==3
  distconductor2=distconductor(1,1);
else distconducto==4
  distconductor2=distconductor(1,1);
end

%Severidad en la carretera: objeto del lado del conductor
T10=[12 30 30;15 25 25;12 20 20;9 30 30;55 55 55;45 45 45;40 40 40;55 55 55;45 45 45;90 90 3000;60 60 60;60 60 60;60 60 60;30 30 30;60 60 60;60 60 60;35 35 35];
objconducto=x(2);
if objconducto==0 %No aplica contramedida
   objconductor=0;
end
if objconducto==1 %Barrera de seguridad – metal
    for i=1:3
 objconductor(1,i)=T10(1,i);
    end
end
if objconducto==2 %Barrera de seguridad – hormigón
    for i=1:3
 objconductor(1,i)=T10(2,i);
    end
end
if objconducto==3 %Barrera de seguridad: amigable para motocicletas
    for i=1:3
 objconductor(1,i)=T10(3,i);
    end
end
if objconducto==4 %Barrera de seguridad - cable de acero
    for i=1:3
 objconductor(1,i)=T10(4,i);
    end
end
if objconducto==5 %Cara vertical agresiva en el talud en corte
    for i=1:3
 objconductor(1,i)=T10(5,i);
    end
end
if objconducto==6 %Pendiente ascendente del talud en corte (15° a 75°)
    for i=1:3
 objconductor(1,i)=T10(6,i);
    end
end
if objconducto==7 %Pendiente empinada del talud en corte (> 75°)
    for i=1:3
 objconductor(1,i)=T10(7,i);
    end
end
if objconducto==8 %Cuneta profunda
    for i=1:3
 objconductor(1,i)=T10(8,i);
    end
end
if objconducto==9 %Terraplén
    for i=1:3
 objconductor(1,i)=T10(9,i);
    end
end
if objconducto==10 %Precipicio
    for i=1:3
 objconductor(1,i)=T10(10,i);
    end
end
if objconducto==11 %Árbol (≥ 10 cm de diámetro)
    for i=1:3
 objconductor(1,i)=T10(11,i);
    end
end
if objconducto==12 %Letrero / poste / barra rígidos (≥ 10 cm de diámetro)
    for i=1:3
 objconductor(1,i)=T10(12,i);
    end
end
if objconducto==13 %Estructura / puente / edificio rígidos
    for i=1:3
 objconductor(1,i)=T10(13,i);
    end
end
if objconducto==14 %Estructura /edificio colapsable
    for i=1:3
 objconductor(1,i)=T10(14,i);
    end
end
if objconducto==15 %Extremo de barrera desprotegido
    for i=1:3
 objconductor(1,i)=T10(15,i);
    end
end
if objconducto==16 %Grandes rocas (≥ 20 cm de altura)
    for i=1:3
 objconductor(1,i)=T10(16,i);
    end
end
if objconducto==17 %Ninguno (u objeto > 20 m de la carretera)
    for i=1:3
 objconductor(1,i)=T10(17,i);
    end
end
if objconducto==0
 objconductor2=0;
elseif objconducto==1
 objconductor2=objconductor(1,1);
elseif objconducto==2
 objconductor2=objconductor(1,1);
elseif objconducto==3
 objconductor2=objconductor(1,1);
elseif objconducto==4
 objconductor2=objconductor(1,1);
elseif objconducto==5
 objconductor2=objconductor(1,1);
elseif objconducto==6
 objconductor2=objconductor(1,1);
elseif objconducto==7
 objconductor2=objconductor(1,1);
elseif objconducto==8
 objconductor2=objconductor(1,1);
elseif objconducto==9
 objconductor2=objconductor(1,1);
elseif objconducto==10
 objconductor2=objconductor(1,1);
elseif objconducto==11
 objconductor2=objconductor(1,1);
elseif objconducto==12
 objconductor2=objconductor(1,1);
elseif objconducto==13
 objconductor2=objconductor(1,1);
elseif objconducto==14
 objconductor2=objconductor(1,1);
elseif objconducto==15
 objconductor2=objconductor(1,1);
elseif objconducto==16
 objconductor2=objconductor(1,1);
else objconducto==17
 objconductor2=objconductor(1,1);
end


%Ancho de espaldón pavimentado (lado del conductor)
T11=[0.77 16 1.2 90 14;0.83 17 1.2 90 15;0.95 18 1.2 90 18;1 20 1.2 90 20];
anchoespaldo=x(6);
if anchoespaldo==0 %No aplica contramedida
  anchoespaldon=0;
end
if anchoespaldo==1 %Ancho (≥ 2,4 m)
    for i=1:5
  anchoespaldon(1,i)=T11(1,i);
    end
end
if anchoespaldo==2 %Medio (≥ 1,0 m a 2,4 m)
    for i=1:5
  anchoespaldon(1,i)=T11(2,i);
    end
end
if anchoespaldo==3 %Estrecho (≥ 0 m a 1,0 m)
    for i=1:5
  anchoespaldon(1,i)=T11(3,i);
    end
end
if anchoespaldo==4 %Ninguno
    for i=1:5
  anchoespaldon(1,i)=T11(4,i);
    end
end
if anchoespaldo==0
  anchoespaldon2=0;
elseif anchoespaldo==1
  anchoespaldon2=anchoespaldon(1,1);
elseif anchoespaldo==2
  anchoespaldon2=anchoespaldon(1,1);
elseif anchoespaldo==3
  anchoespaldon2=anchoespaldon(1,1);
else anchoespaldo==4
  anchoespaldon2=anchoespaldon(1,1);
end

%Velocidad de operacion (aqui toma el +10km/h)
veloperacio=x(52);
limitevelo=x(49);
veloperaciom=max(limitevelo,veloperacio);
if veloperaciom==150
    veloperacion=1;
elseif veloperaciom==145
    veloperacion=0.91;
elseif veloperaciom==140
         veloperacion=0.81;
elseif veloperaciom==135
         veloperacion=0.73;
elseif veloperaciom==130
         veloperacion=0.66;
elseif veloperaciom==125
         veloperacion=0.58;
elseif veloperaciom==120
        veloperacion=0.51;
elseif veloperaciom==115
         veloperacion=0.44;
elseif veloperaciom==110
         veloperacion=0.39;
elseif veloperaciom==105
         veloperacion=0.34;
elseif veloperaciom==100
         veloperacion=0.29;
elseif veloperaciom==95
         veloperacion=0.25;  
elseif veloperaciom==90
         veloperacion=0.21;
elseif veloperaciom==85
         veloperacion=0.18;
elseif veloperaciom==80
         veloperacion=0.15;
elseif veloperaciom==75
         veloperacion=0.11;
elseif veloperaciom==70
         veloperacion=0.1;
elseif veloperaciom==65
         veloperacion=0.08;
elseif veloperaciom==60
         veloperacion=0.06;
elseif veloperaciom==55
         veloperacion=0.05;
elseif veloperaciom==50
         veloperacion=0.04;
elseif veloperaciom==45
         veloperacion=0.03;
elseif veloperaciom==40
         veloperacion=0.02;
elseif veloperaciom==35
         veloperacion=0.01;
elseif veloperaciom==30
         veloperacion=0;
else veloperaciom==0
         veloperacion=0;
end

%Severidad en la carretera: objeto del lado del copiloto
objcopilot=x(4);
if objcopilot==0 %No aplica contramedida
   objcopiloto=0;
end
if objcopilot==1
    for i=1:3
 objcopiloto(1,i)=T10(1,i);
    end
end
if objcopilot==2
    for i=1:3
 objcopiloto(1,i)=T10(2,i);
    end
end
if objcopilot==3
    for i=1:3
 objcopiloto(1,i)=T10(3,i);
    end
end
if objcopilot==4
    for i=1:3
 objcopiloto(1,i)=T10(4,i);
    end
end
if objcopilot==5
    for i=1:3
 objcopiloto(1,i)=T10(5,i);
    end
end
if objcopilot==6
    for i=1:3
 objcopiloto(1,i)=T10(6,i);
    end
end
if objcopilot==7
    for i=1:3
 objcopiloto(1,i)=T10(7,i);
    end
end
if objcopilot==8
    for i=1:3
 objcopiloto(1,i)=T10(8,i);
    end
end
if objcopilot==9
    for i=1:3
 objcopiloto(1,i)=T10(9,i);
    end
end
if objcopilot==10
    for i=1:3
 objcopiloto(1,i)=T10(10,i);
    end
end
if objcopilot==11
    for i=1:3
 objcopiloto(1,i)=T10(11,i);
    end
end
if objcopilot==12
    for i=1:3
 objcopiloto(1,i)=T10(12,i);
    end
end
if objcopilot==13
    for i=1:3
 objcopiloto(1,i)=T10(13,i);
    end
end
if objcopilot==14
    for i=1:3
 objcopiloto(1,i)=T10(14,i);
    end
end
if objcopilot==15
    for i=1:3
 objcopiloto(1,i)=T10(15,i);
    end
end
if objcopilot==16
    for i=1:3
 objcopiloto(1,i)=T10(16,i);
    end
end
if objcopilot==17
    for i=1:3
 objcopiloto(1,i)=T10(17,i);
    end
end
if objcopilot==0
 objcopiloto2=0;
elseif objcopilot==1
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==2
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==3
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==4
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==5
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==6
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==7
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==8
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==9
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==10
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==11
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==12
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==13
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==14
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==15
 objcopiloto2=objcopiloto(1,1);
elseif objcopilot==16
 objcopiloto2=objcopiloto(1,1);
else objcopilot==17
 objcopiloto2=objcopiloto(1,1);
end

velosalida=veloperacion;
if veloperaciom==150 && objconducto>=1 && objcopilot==10
    velosalida=1;
elseif veloperaciom==145 && objconducto>=1 && objcopilot==10
    velosalida=0.97;
elseif veloperaciom==140 && objconducto>=1 && objcopilot==10
         velosalida=0.93; 
elseif veloperaciom==135 && objconducto>=1 && objcopilot==10
         velosalida=0.90;
elseif veloperaciom==130 && objconducto>=1 && objcopilot==10
         velosalida=0.87;
elseif veloperaciom==125 && objconducto>=1 && objcopilot==10
         velosalida=0.83;
elseif veloperaciom==120 && objconducto>=1 && objcopilot==10
        velosalida=0.80;
elseif veloperaciom==115 && objconducto>=1 && objcopilot==10
         velosalida=0.77;
elseif veloperaciom==110 && objconducto>=1 && objcopilot==10
         velosalida=0.73;
elseif veloperaciom==105 && objconducto>=1 && objcopilot==10
         velosalida=0.70;
elseif veloperaciom==100 && objconducto>=1 && objcopilot==10
         velosalida=0.67;
elseif veloperaciom==95 && objconducto>=1 && objcopilot==10
         velosalida=0.63;  
elseif veloperaciom==90 && objconducto>=1 && objcopilot==10
         velosalida=0.60;
elseif veloperaciom==85 && objconducto>=1 && objcopilot==10
         velosalida=0.57;
elseif veloperaciom==80 && objconducto>=1 && objcopilot==10
         velosalida=0.53;
elseif veloperaciom==75 && objconducto>=1 && objcopilot==10
         velosalida=0.50;
elseif veloperaciom==70 && objconducto>=1 && objcopilot==10
         velosalida=0.47;
elseif veloperaciom==65 && objconducto>=1 && objcopilot==10
         velosalida=0.43;
elseif veloperaciom==60 && objconducto>=1 && objcopilot==10
         velosalida=0.40;
elseif veloperaciom==55 && objconducto>=1 && objcopilot==10
         velosalida=0.36;
elseif veloperaciom==50 && objconducto>=1 && objcopilot==10
         velosalida=0.33;
elseif veloperaciom==45 && objconducto>=1 && objcopilot==10
         velosalida=0.30;
elseif veloperaciom==40 && objconducto>=1 && objcopilot==10
         velosalida=0.27;
elseif veloperaciom==35 && objconducto>=1 && objcopilot==10
         velosalida=0.23;
elseif veloperaciom==30 && objconducto>=1 && objcopilot==10
         velosalida=0.2;
elseif veloperaciom==150 && objcopilot>=1 && objconducto==10
    velosalida=1;
elseif veloperaciom==145 && objcopilot>=1 && objconducto==10
    velosalida=0.97;
elseif veloperaciom==140 && objcopilot>=1 && objconducto==10
         velosalida=0.93; 
elseif veloperaciom==135 && objcopilot>=1 && objconducto==10
         velosalida=0.90;
elseif veloperaciom==130 && objcopilot>=1 && objconducto==10
         velosalida=0.87;
elseif veloperaciom==125 && objcopilot>=1 && objconducto==10
         velosalida=0.83;
elseif veloperaciom==120 && objcopilot>=1 && objconducto==10
        velosalida=0.80;
elseif veloperaciom==115 && objcopilot>=1 && objconducto==10
         velosalida=0.77;
elseif veloperaciom==110 && objcopilot>=1 && objconducto==10
         velosalida=0.73;
elseif veloperaciom==105 && objcopilot>=1 && objconducto==10
         velosalida=0.70;
elseif veloperaciom==100 && objcopilot>=1 && objconducto==10
         velosalida=0.67;
elseif veloperaciom==95 && objcopilot>=1 && objconducto==10
         velosalida=0.63;  
elseif veloperaciom==90 && objcopilot>=1 && objconducto==10
         velosalida=0.60;
elseif veloperaciom==85 && objcopilot>=1 && objconducto==10
         velosalida=0.57;
elseif veloperaciom==80 && objcopilot>=1 && objconducto==10
         velosalida=0.53;
elseif veloperaciom==75 && objcopilot>=1 && objconducto==10
         velosalida=0.50;
elseif veloperaciom==70 && objcopilot>=1 && objconducto==10
         velosalida=0.47;
elseif veloperaciom==65 && objcopilot>=1 && objconducto==10
         velosalida=0.43;
elseif veloperaciom==60 && objcopilot>=1 && objconducto==10
         velosalida=0.40;
elseif veloperaciom==55 && objcopilot>=1 && objconducto==10
         velosalida=0.36;
elseif veloperaciom==50 && objcopilot>=1 && objconducto==10
         velosalida=0.33;
elseif veloperaciom==45 && objcopilot>=1 && objconducto==10
         velosalida=0.30;
elseif veloperaciom==40 && objcopilot>=1 && objconducto==10
         velosalida=0.27;
elseif veloperaciom==35 && objcopilot>=1 && objconducto==10
         velosalida=0.23;
elseif veloperaciom==30 && objcopilot>=1 && objconducto==10
         velosalida=0.2;       
end
%Reducción prevista de los MLG (si la medida se instalara por si sola)
OVsalidacaminoconductor=zeros(1,12);
OVsalidacaminoconductor(1)=anchocarril;
OVsalidacaminoconductor(2)=curvatura2;
OVsalidacaminoconductor(3)=calidadcurva2;
OVsalidacaminoconductor(4)=delineacion;
OVsalidacaminoconductor(5)=bandasonoraes;
OVsalidacaminoconductor(6)=estadosuperficie2;
OVsalidacaminoconductor(7)=pendiente;
OVsalidacaminoconductor(8)=resdeslizamiento2;
OVsalidacaminoconductor(9)=objconductor2;
OVsalidacaminoconductor(10)=distconductor2;
OVsalidacaminoconductor(11)=anchoespaldon2;
OVsalidacaminoconductor(12)=velosalida;

OVsalidacaminoconductor2=y.Factores1

for i=1:length(OVsalidacaminoconductor)
    p(i+1)=((OVsalidacaminoconductor(i)-OVsalidacaminoconductor2(i))*100)/((OVsalidacaminoconductor(i)));
end
OVsalidacaminoconductor3=p(2:end);
TF = isnan(OVsalidacaminoconductor3);
OVsalidacaminoconductor3(TF) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j=1:length(OVsalidacaminoconductor3)
    q(j+1)=MLG*(OVsalidacaminoconductor3(j)/100);
end
OVsalidacaminoconductor4=q(2:end);
Total=sum(OVsalidacaminoconductor4);

%Reducción MGL - Método multiplicativo
for k=1:length(OVsalidacaminoconductor4)
    s(k+1)=1-(OVsalidacaminoconductor3(k)/100);
end
OVsalidacaminoconductor5=s(2:end);
MLG_anual=MLG*(1-(prod(OVsalidacaminoconductor5)))

%Factor de corrección de multiples medidas de mejora
FCAC=MLG_anual/Total;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h=1:length(OVsalidacaminoconductor5)
    t(h+1)=OVsalidacaminoconductor4(h)*FCAC;
end
OVsalidacaminoconductor6=t(2:end);
Reduccion_total_MGL=sum(OVsalidacaminoconductor6);
TFx = isnan(Reduccion_total_MGL);
Reduccion_total_MGL(TFx)=0;

%----Salida de camino------Lado del copiloto
%Factores de los atributos codificados
%Severidad en la carretera: distancia del lado del copiloto
distcopilot=x(3);
if distcopilot==0 %No aplica contramedida
  distcopiloto=0;
end
if distcopilot==1
    for i=1:3
  distcopiloto(1,i)=T9(1,i);
    end
end
if distcopilot==2
        for i=1:3
  distcopiloto(1,i)=T9(2,i);
    end
end
if distcopilot==3
        for i=1:3
  distcopiloto(1,i)=T9(3,i);
    end
end
if distcopilot==4
        for i=1:3
  distcopiloto(1,i)=T9(4,i);
    end
end
if distcopilot==0
  distcopiloto2=0;
elseif distcopilot==1
  distcopiloto2=distcopiloto(1,1);
elseif distcopilot==2
  distcopiloto2=distcopiloto(1,1);
elseif distcopilot==3
  distcopiloto2=distcopiloto(1,1);
else distcopilot==4
  distcopiloto2=distcopiloto(1,1);
end

%Ancho de espaldón pavimentado (lado del copiloto)
anchoespaldonco=x(7);
if anchoespaldonco==0 %No aplica contramedida
  anchoespaldoncop=0;
end
if anchoespaldonco==1
    for i=1:5
  anchoespaldoncop(1,i)=T11(1,i);
    end
end
if anchoespaldonco==2
    for i=1:5
  anchoespaldoncop(1,i)=T11(2,i);
    end
end
if anchoespaldonco==3
    for i=1:5
  anchoespaldoncop(1,i)=T11(3,i);
    end
end
if anchoespaldonco==4
    for i=1:5
  anchoespaldoncop(1,i)=T11(4,i);
    end
end
if anchoespaldonco==0
  anchoespaldoncop2=0;
elseif anchoespaldonco==1
  anchoespaldoncop2=anchoespaldoncop(1,1);
elseif anchoespaldonco==2
  anchoespaldoncop2=anchoespaldoncop(1,1);
elseif anchoespaldonco==3
  anchoespaldoncop2=anchoespaldoncop(1,1);
else anchoespaldonco==4
  anchoespaldoncop2=anchoespaldoncop(1,1);
end
 
%Reducción prevista de los MLG (si la medida se instalara por si sola)
OVsalidacaminocopiloto=zeros(1,12);
OVsalidacaminocopiloto(1)=anchocarril;
OVsalidacaminocopiloto(2)=curvatura2;
OVsalidacaminocopiloto(3)=calidadcurva2;
OVsalidacaminocopiloto(4)=delineacion;
OVsalidacaminocopiloto(5)=bandasonoraes;
OVsalidacaminocopiloto(6)=estadosuperficie2;
OVsalidacaminocopiloto(7)=pendiente;
OVsalidacaminocopiloto(8)=resdeslizamiento2;
OVsalidacaminocopiloto(9)=objcopiloto2;
OVsalidacaminocopiloto(10)=distcopiloto2;
OVsalidacaminocopiloto(11)=anchoespaldoncop2;
OVsalidacaminocopiloto(12)=velosalida

OVsalidacaminocopiloto2=y.Factores2

for i1=1:length(OVsalidacaminocopiloto)
    p1(i1+1)=((OVsalidacaminocopiloto(i1)-OVsalidacaminocopiloto2(i1))*100)/((OVsalidacaminocopiloto(i1)));
end
OVsalidacaminocopiloto3=p1(2:end);
TF1 = isnan(OVsalidacaminocopiloto3);
OVsalidacaminocopiloto3(TF1) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j1=1:length(OVsalidacaminocopiloto3)
    q1(j1+1)=MLG*(OVsalidacaminocopiloto3(j1)/100);
end
OVsalidacaminocopiloto4=q1(2:end);
Total1=sum(OVsalidacaminocopiloto4);

%Reducción MGL - Método multiplicativo
for k1=1:length(OVsalidacaminocopiloto4)
    s1(k1+1)=1-(OVsalidacaminocopiloto3(k1)/100);
end
OVsalidacaminocopiloto5=s1(2:end);
MLG_anual1=MLG*(1-(prod(OVsalidacaminocopiloto5)));

%Factor de corrección de multiples medidas de mejora
FCAC1=MLG_anual1/Total1;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h1=1:length(OVsalidacaminocopiloto5)
    t1(h1+1)=OVsalidacaminocopiloto4(h1)*FCAC1;
end
OVsalidacaminocopiloto6=t1(2:end);
Reduccion_total_MGL1=sum(OVsalidacaminocopiloto6);
TF1x = isnan(Reduccion_total_MGL1);
Reduccion_total_MGL1(TF1x) = 0;

%-------%Choque frontal----(pérdida de control)
%Factores de los atributos codificados
%Bandas sonoras centrales
bandassonora=x(11);
if bandassonora==0 %No aplica contramedida
    bandassonoras=0;
elseif bandassonora==1 %Ausente
    bandassonoras=1.20;
else bandassonora==2 %Presente
     bandassonoras=1;
end

%Tipo de mediana
T13=[0 0 1 0.7;0 0 1 0.7;2 0 1 0.7;10 0 1 0.7;35 0 1 0.7;80 0 1 0.7;90 0 1.6 0.7;77 25 3 1;90 0 2.7 1;83 82.5 2.4 1;100 100 3 1;0 0 1 0.7;0 0 1 0.7;95 100 2.7 1;0 0 1 0.7];
tipomedian=x(10);
if tipomedian==0 %No aplica contramedidas
 tipomediana=0;
end
if tipomedian==1 %Barrera de seguridad – metal
    for i=1:4
 tipomediana(1,i)=T13(1,i);
    end
end
if tipomedian==2 %Barrera de seguridad – hormigón
    for i=1:4
 tipomediana(1,i)=T13(2,i);
    end
end
if tipomedian==3 %Mediana física con un ancho ≥ 20 m
    for i=1:4
 tipomediana(1,i)=T13(3,i);
    end
end
if tipomedian==4 %Mediana física con un ancho ≥ 10m a < 20 m
    for i=1:4
 tipomediana(1,i)=T13(4,i);
    end
end
if tipomedian==5 %Mediana física con un ancho ≥ 5 m a < 10 m
    for i=1:4
 tipomediana(1,i)=T13(5,i);
    end
end
if tipomedian==6 %Mediana física con un ancho ≥ 1 m a < 5 m
    for i=1:4
 tipomediana(1,i)=T13(6,i);
    end
end
if tipomedian==7 %Mediana física con un ancho ≥ 0 m a < 1 m
    for i=1:4
 tipomediana(1,i)=T13(7,i);
    end
end
if tipomedian==8 %Carril central continuo para giro
    for i=1:4
 tipomediana(1,i)=T13(8,i);
    end
end
if tipomedian==9 %Delineadores flexibles
    for i=1:4
 tipomediana(1,i)=T13(9,i);
    end
end
if tipomedian==10 %Raya separadora de sentidos de circulación doble > 1 m y rayas diagonales a 45°
    for i=1:4
 tipomediana(1,i)=T13(10,i);
    end
end
if tipomedian==11 %Línea central
    for i=1:4
 tipomediana(1,i)=T13(11,i);
    end
end
if tipomedian==12 %Barrera de seguridad - amigable para motociclistas
    for i=1:4
 tipomediana(1,i)=T13(12,i);
    end
end
if tipomedian==13 %Un solo sentido
    for i=1:4
 tipomediana(1,i)=T13(13,i);
    end
end
if tipomedian==14 %Raya separadora de sentidos de circulación doble (0.3m a 1m) y rayas diagonales a 45°
    for i=1:4
 tipomediana(1,i)=T13(14,i);
    end
end
if tipomedian==15 %Barrera de seguridad - cable de acero
    for i=1:4
 tipomediana(1,i)=T13(15,i);
    end
end
if tipomedian==0
 tipomediana2=0;
elseif tipomedian==1
 tipomediana2=tipomediana(1,1);
elseif tipomedian==2
 tipomediana2=tipomediana(1,1);
elseif tipomedian==3
 tipomediana2=tipomediana(1,1);
elseif tipomedian==4
 tipomediana2=tipomediana(1,1);
elseif tipomedian==5
 tipomediana2=tipomediana(1,1);
elseif tipomedian==6
 tipomediana2=tipomediana(1,1);
elseif tipomedian==7
 tipomediana2=tipomediana(1,1);
elseif tipomedian==8
 tipomediana2=tipomediana(1,1);
elseif tipomedian==9
 tipomediana2=tipomediana(1,1);
elseif tipomedian==10
 tipomediana2=tipomediana(1,1);
elseif tipomedian==11
 tipomediana2=tipomediana(1,1);
elseif tipomedian==12
 tipomediana2=tipomediana(1,1);
elseif tipomedian==13
 tipomediana2=tipomediana(1,1);
elseif tipomedian==14
 tipomediana2=tipomediana(1,1);
else tipomedian==15
 tipomediana2=tipomediana(1,1);
end 

%Velocidad de operacion (aqui toma el -10km/h)
if veloperacio==150
        veloperacion1=1;
elseif veloperacio==145
         veloperacion1=0.91;
elseif veloperacio==140
         veloperacion1=0.81;
elseif veloperacio==135
         veloperacion1=0.73;
elseif veloperacio==130
         veloperacion1=0.66;
elseif veloperacio==125
         veloperacion1=0.58;
elseif veloperacio==120
        veloperacion1=0.51;
elseif veloperacio==115
         veloperacion1=0.44;
elseif veloperacio==110
         veloperacion1=0.39;
elseif veloperacio==105
         veloperacion1=0.34;
elseif veloperacio==100
         veloperacion1=0.29;
elseif veloperacio==95
         veloperacion1=0.25;   
elseif veloperacio==90
         veloperacion1=0.21;
elseif veloperacio==85
         veloperacion1=0.18;
elseif veloperacio==80
         veloperacion1=0.15;
elseif veloperacio==75
         veloperacion1=0.11;
elseif veloperacio==70
         veloperacion1=0.1;
elseif veloperacio==65
         veloperacion1=0.08;
elseif veloperacio==60
         veloperacion1=0.06;
elseif veloperacio==55
         veloperacion1=0.05;
elseif veloperacio==50
         veloperacion1=0.04;
elseif veloperacio==45
         veloperacion1=0.03;
elseif veloperacio==40
         veloperacion1=0.02;
elseif veloperacio==35;
         veloperacion1=0.01
elseif veloperacio==30
         veloperacion1=0;
else veloperacio==0
         veloperacion1=0;    
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
OVperdidacontrol=zeros(1,10);
OVperdidacontrol(1)=anchocarril;
OVperdidacontrol(2)=curvatura2;
OVperdidacontrol(3)=calidadcurva2;
OVperdidacontrol(4)=delineacion;
OVperdidacontrol(5)=bandassonoras;
OVperdidacontrol(6)=estadosuperficie2;
OVperdidacontrol(7)=pendiente;
OVperdidacontrol(8)=resdeslizamiento2;
OVperdidacontrol(9)=tipomediana2;
OVperdidacontrol(10)=veloperacion1

OVperdidacontrol2=y.Factores3

for i2=1:length(OVperdidacontrol)
    p2(i2+1)=((OVperdidacontrol(i2)-OVperdidacontrol2(i2))*100)/((OVperdidacontrol(i2)));
end
OVperdidacontrol3=p2(2:end);
TF2 = isnan(OVperdidacontrol3);
OVperdidacontrol3(TF2) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j2=1:length(OVperdidacontrol3)
    q2(j2+1)=MLG*(OVperdidacontrol3(j2)/100);
end
OVperdidacontrol4=q2(2:end);
Total2=sum(OVperdidacontrol4);

%Reducción MGL - Método multiplicativo
for k2=1:length(OVperdidacontrol4)
    s2(k2+1)=1-(OVperdidacontrol3(k2)/100);
end
OVperdidacontrol5=s2(2:end);
MLG_anual2=MLG*(1-(prod(OVperdidacontrol5)));

%Factor de corrección de multiples medidas de mejora
FCAC2=MLG_anual2/Total2;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h2=1:length(OVperdidacontrol5)
    t2(h2+1)=OVperdidacontrol4(h2)*FCAC2;
end
OVperdidacontrol6=t2(2:end);
Reduccion_total_MGL2=sum(OVperdidacontrol6);
TF2x = isnan(Reduccion_total_MGL2);
Reduccion_total_MGL2(TF2x) = 0;

%-----Choque frontal ----- (adelantamiento)
%Factores de los atributos codificados
%Numero de carriles
T14=[1 1;0.02 2.8;0.01 5.2;0.01 8;0.5 1.8;0.02 4];
ncarrile=x(12);
if ncarrile==0 %No aplica contramedidas
    ncarriles=0;
end
if ncarrile==1 %Uno
    for i=1:2
    ncarriles(1,i)=T14(1,i);
    end
end
if ncarrile==2 %Dos
    for i=1:2
    ncarriles(1,i)=T14(2,i);
    end
end
if ncarrile==3 %Tres
    for i=1:2
    ncarriles(1,i)=T14(3,i);
    end
end
if ncarrile==4 %Cuatro o mas
    for i=1:2
    ncarriles(1,i)=T14(4,i);
    end
end
if ncarrile==5 %Dos y uno
    for i=1:2
    ncarriles(1,i)=T14(5,i);
    end
end
if ncarrile==6 %Tres y dos
    for i=1:2
    ncarriles(1,i)=T14(6,i);
    end
end
if ncarrile==0
    ncarriles2=0;
elseif ncarrile==1
    ncarriles2=ncarriles(1,1);
elseif ncarrile==2
        ncarriles2=ncarriles(1,1);
elseif ncarrile==3
        ncarriles2=ncarriles(1,1);
elseif ncarrile==4
        ncarriles2=ncarriles(1,1); 
elseif ncarrile==5
        ncarriles2=ncarriles(1,1);
else ncarrile==6
        ncarriles2=ncarriles(1,1);
end
%Velocidades diferenciales
velodiferenci=x(50);
if velodiferenci==0 %No se aplica contramedidas
    velodiferencial=0;
elseif velodiferenci==1 %Ausente
    velodiferencial=1;
else velodiferenci==2 %Presente
     velodiferencial=1.2;
end

if tipomedian==0
 tipomediana3=0;
elseif tipomedian==1
 tipomediana3=tipomediana(1,2);
elseif tipomedian==2
 tipomediana3=tipomediana(1,2);
elseif tipomedian==3
 tipomediana3=tipomediana(1,2);
elseif tipomedian==4
 tipomediana3=tipomediana(1,2);
elseif tipomedian==5
 tipomediana3=tipomediana(1,2);
elseif tipomedian==6
 tipomediana3=tipomediana(1,2);
elseif tipomedian==7
 tipomediana3=tipomediana(1,2);
elseif tipomedian==8
 tipomediana3=tipomediana(1,2);
elseif tipomedian==9
 tipomediana3=tipomediana(1,2);
elseif tipomedian==10
 tipomediana3=tipomediana(1,2);
elseif tipomedian==11
 tipomediana3=tipomediana(1,2);
elseif tipomedian==12
 tipomediana3=tipomediana(1,2);
elseif tipomedian==13
 tipomediana3=tipomediana(1,2);
elseif tipomedian==14
 tipomediana3=tipomediana(1,2);
else tipomedian==15
 tipomediana3=tipomediana(1,2);
end
%Reducción prevista de los MLG (si la medida se instalara por si sola)
OVadelantemiento=zeros(1,6);
OVadelantemiento(1)=ncarriles2;
OVadelantemiento(2)=pendiente;
OVadelantemiento(3)=resdeslizamiento2;
OVadelantemiento(4)=velodiferencial;
OVadelantemiento(5)=tipomediana3; 
OVadelantemiento(6)=veloperacion1 

OVadelantemiento2=y.Factores4


for i3=1:length(OVadelantemiento)
    p3(i3+1)=((OVadelantemiento(i3)-OVadelantemiento2(i3))*100)/((OVadelantemiento(i3)));
end
OVadelantemiento3=p3(2:end);
TF3 = isnan(OVadelantemiento3);
OVadelantemiento3(TF3) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j3=1:length(OVadelantemiento3)
    q3(j3+1)=MLG*(OVadelantemiento3(j3)/100);
end
OVadelantemiento4=q3(2:end);
Total3=sum(OVadelantemiento4);

%Reducción MGL - Método multiplicativo
for k3=1:length(OVadelantemiento4)
    s3(k3+1)=1-(OVadelantemiento3(k3)/100);
end
OVadelantemiento5=s3(2:end);
MLG_anual3=MLG*(1-(prod(OVadelantemiento5)));

%Factor de corrección de multiples medidas de mejora
FCAC3=MLG_anual3/Total3;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h3=1:length(OVadelantemiento5)
    t3(h3+1)=OVadelantemiento4(h3)*FCAC3;
end
OVadelantemiento6=t3(2:end);
Reduccion_total_MGL3=sum(OVadelantemiento6);
TF3x = isnan(Reduccion_total_MGL3);
Reduccion_total_MGL3(TF3x) = 0;

%-----Intersecciones
%Factores de los atributos codificados
%Tipo de interseccion
T15=[6 15 1.05 40 6 20;15 15 1.5 150 30 30;13 45 1.1 45 17 45;16 45 1.1 55 20 45;9 45 1.1 30 9 45;12 45 1.1 40 14 45;16 50 1.2 55 16 50;23 50 1.2 80 26 50;10 50 1.2 35 10 50;15 50 1.2 50 16 50;0 0 1 0 0 0;1 150 1 3 1 150;0.5 150 1 1 0.5 150;0.5 45 1.1 2 0.5 45;0.3 45 1.1 1 0.3 45;16 35 1.3 55 16 35];
tipointe=x(25);
if tipointe==0 %No se aplica contramedidas
    tipointer=0;
end
if tipointe==1 %Carril de incorporacion
    for i=1:6
    tipointer(1,i)=T15(1,i);
    end
end
if tipointe==2 %Rotonda
    for i=1:6
    tipointer(1,i)=T15(2,i);
    end
end
if tipointe==3 %3 ramas (no semaforizada) con giro continuo
    for i=1:6
    tipointer(1,i)=T15(3,i)
    end
end
if tipointe==4 %3 ramas (no semaforizada) sin giro continuo
    for i=1:6
    tipointer(1,i)=T15(4,i);
    end
end
if tipointe==5 %3 ramas (semaforizada) con giro continuo
    for i=1:6
    tipointer(1,i)=T15(5,i);
    end
end
if tipointe==6 %3 ramas (semaforizada) sin giro continuo
    for i=1:6
    tipointer(1,i)=T15(6,i);
    end
end
if tipointe==7 %4 ramas (no semaforizada) con giro continuo
    for i=1:6
    tipointer(1,i)=T15(7,i);
    end
end
if tipointe==8 %4 ramas (no semaforizada) sin giro continuo
    for i=1:6
    tipointer(1,i)=T15(8,i);
    end
end
if tipointe==9 %4 ramas (semaforizada) con giro continuo
    for i=1:6
    tipointer(1,i)=T15(9,i);
    end
end
if tipointe==10 %4 ramas (semaforizada) sin giro continuo
    for i=1:6
    tipointer(1,i)=T15(10,i);
    end
end
if tipointe==11 %Ninguno
    for i=1:6
    tipointer(1,i)=T15(11,i);
    end
end
if tipointe==12 %Cruce de ferrocarril - pasivo (solo señalizacion vertical)
    for i=1:6
    tipointer(1,i)=T15(12,i);
    end
end
if tipointe==13 %Cruce de ferrocarril - activo (semaforo intermitente/pluma)
    for i=1:6
    tipointer(1,i)=T15(13,i);
    end
end
if tipointe==14 %Punto de cruce de faja separadora central - informal
    for i=1:6
    tipointer(1,i)=T15(14,i);
    end
end
if tipointe==15 %Punto de cruce de faja separadora central - formal
    for i=1:6
    tipointer(1,i)=T15(15,i);
    end
end
if tipointe==16 %Minirotonda
    for i=1:6
    tipointer(1,i)=T15(16,i);
    end
end
if tipointe==0
    tipointer2=0;
elseif tipointe==1
    tipointer2=tipointer(1,1);
elseif tipointe==2
    tipointer2=tipointer(1,1);
elseif tipointe==3
    tipointer2=tipointer(1,1);
elseif tipointe==4
    tipointer2=tipointer(1,1);
elseif tipointe==5
    tipointer2=tipointer(1,1);
elseif tipointe==6
    tipointer2=tipointer(1,1);
elseif tipointe==7
    tipointer2=tipointer(1,1);
elseif tipointe==8
    tipointer2=tipointer(1,1);
elseif tipointe==9
    tipointer2=tipointer(1,1);
elseif tipointe==10
    tipointer2=tipointer(1,1);
elseif tipointe==11
    tipointer2=tipointer(1,1);
elseif tipointe==12
    tipointer2=tipointer(1,1);
elseif tipointe==13
    tipointer2=tipointer(1,1);
elseif tipointe==14
    tipointer2=tipointer(1,1);
elseif tipointe==15
    tipointer2=tipointer(1,1);
else tipointe==16
    tipointer2=tipointer(1,1);
end

%Calidad de la interseccion 
calinte=x(28);
if calinte==0 %No aplica contramedidas
    calinter=0;
elseif calinte==1 %Adecuado
    calinter=1;
elseif calinte==2 %Deficiente
     calinter=1.2;
else calinte==3 %No aplica
      calinter=1;
end
%Alumbrado publico
T17=[1.15 1.25 1.25;1 1 1];
alumbrad=x(20);
if alumbrad==0
    alumbrado=0;
end
if alumbrad==1 %Ausente
    for i=1:3
    alumbrado(1,i)=T17(1,i);
    end
end
if alumbrad==2 %Presente
    for i=1:3
    alumbrado(1,i)=T17(2,i);
    end
end
if alumbrad==0
    alumbrado1=0;
elseif alumbrad==1
    alumbrado1=alumbrado(1,1);
else  alumbrad==2
      alumbrado1=alumbrado(1,1);
end

%Distancia visual
distvisua=x(24);
if distvisua==0 %No aplica contramedidas
    distvisual=0;
elseif distvisua==1 %Adecuada
    distvisual=1;
else distvisua==2 %Deficiente
     distvisual=1.42;
end

%Canalización de la intersección
caninte=x(26);
if caninte==0 %No aplica contramedidas
    caninter=0;
elseif caninte==1 %Ausente
    caninter=1.2;
else caninte==2 %Presente
     caninter=1;
end

%Gestión de la velocidad / Calmante del tráfico
T19=[1.25 1.25 1.25;1 1 1];
gestvel=x(51);
if gestvel==0 %No aplica contramedidas
    gestvelo=0;
elseif gestvel==1 %Ausente
    gestvelo=1.25;
else gestvel==2 %Presente
     gestvelo=1;
end

if tipointe==0
    tipointer3=0;
elseif tipointe==1
    tipointer3=tipointer(1,2);
elseif tipointe==2
    tipointer3=tipointer(1,2);
elseif tipointe==3
    tipointer3=tipointer(1,2);
elseif tipointe==4
    tipointer3=tipointer(1,2);
elseif tipointe==5
    tipointer3=tipointer(1,2);
elseif tipointe==6
    tipointer3=tipointer(1,2);
elseif tipointe==7
    tipointer3=tipointer(1,2);
elseif tipointe==8
    tipointer3=tipointer(1,2);
elseif tipointe==9
    tipointer3=tipointer(1,2);
elseif tipointe==10
    tipointer3=tipointer(1,2);
elseif tipointe==11
    tipointer3=tipointer(1,2);
elseif tipointe==12
    tipointer3=tipointer(1,2);
elseif tipointe==13
    tipointer3=tipointer(1,2);
elseif tipointe==14
    tipointer3=tipointer(1,2);
elseif tipointe==15
    tipointer3=tipointer(1,2);
else tipointe==16
    tipointer3=tipointer(1,2);
end

%Velocidad para la intersección
velointer=veloperacion;
if veloperaciom==150 && tipointe==12
    velointer=1;
elseif veloperaciom==145 && tipointe==12
    velointer=0.97;
elseif veloperaciom==140 && tipointe==12
         velointer=0.93; 
elseif veloperaciom==135 && tipointe==12
         velointer=0.90;
elseif veloperaciom==130 && tipointe==12
         velointer=0.87;
elseif veloperaciom==125 && tipointe==12
         velointer=0.83;
elseif veloperaciom==120 && tipointe==12
        velointer=0.80;
elseif veloperaciom==115 && tipointe==12
         velointer=0.77;
elseif veloperaciom==110 && tipointe==12
         velointer=0.73;
elseif veloperaciom==105 && tipointe==12
         velointer=0.70;
elseif veloperaciom==100 && tipointe==12
         velointer=0.67;
elseif veloperaciom==95 && tipointe==12
         velointer=0.63;  
elseif veloperaciom==90 && tipointe==12
         velointer=0.60;
elseif veloperaciom==85 && tipointe==12
         velointer=0.57;
elseif veloperaciom==80 && tipointe==12
         velointer=0.53;
elseif veloperaciom==75 && tipointe==12
         velointer=0.50;
elseif veloperaciom==70 && tipointe==12
         velointer=0.47;
elseif veloperaciom==65 && tipointe==12
         velointer=0.43;
elseif veloperaciom==60 && tipointe==12
         velointer=0.40;
elseif veloperaciom==55 && tipointe==12
         velointer=0.36;
elseif veloperaciom==50 && tipointe==12
         velointer=0.33;
elseif veloperaciom==45 && tipointe==12
         velointer=0.30;
elseif veloperaciom==40 && tipointe==12
         velointer=0.27;
elseif veloperaciom==35 && tipointe==12
         velointer=0.23;
elseif veloperaciom==30 && tipointe==12
         velointer=0.2;
elseif veloperaciom==150 && tipointe==13
    velointer=1;
elseif veloperaciom==145 && tipointe==13
    velointer=0.97;
elseif veloperaciom==140 && tipointe==13
         velointer=0.93; 
elseif veloperaciom==135 && tipointe==13
         velointer=0.90;
elseif veloperaciom==130 && tipointe==13
         velointer=0.87;
elseif veloperaciom==125 && tipointe==13
         velointer=0.83;
elseif veloperaciom==120 && tipointe==13
        velointer=0.80;
elseif veloperaciom==115 && tipointe==13
         velointer=0.77;
elseif veloperaciom==110 && tipointe==13
         velointer=0.73;
elseif veloperaciom==105 && tipointe==13
         velointer=0.70;
elseif veloperaciom==100 && tipointe==13
         velointer=0.67;
elseif veloperaciom==95 && tipointe==13
         velointer=0.63;  
elseif veloperaciom==90 && tipointe==13
         velointer=0.60;
elseif veloperaciom==85 && tipointe==13
         velointer=0.57;
elseif veloperaciom==80 && tipointe==13
         velointer=0.53;
elseif veloperaciom==75 && tipointe==13
         velointer=0.50;
elseif veloperaciom==70 && tipointe==13
         velointer=0.47;
elseif veloperaciom==65 && tipointe==13
         velointer=0.43;
elseif veloperaciom==60 && tipointe==13
         velointer=0.40;
elseif veloperaciom==55 && tipointe==13
         velointer=0.36;
elseif veloperaciom==50 && tipointe==13
         velointer=0.33;
elseif veloperaciom==45 && tipointe==13
         velointer=0.30;
elseif veloperaciom==40 && tipointe==13
         velointer=0.27;
elseif veloperaciom==35 && tipointe==13
         velointer=0.23;
elseif veloperaciom==30 && tipointe==13
         velointer=0.2;
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
OVintersecciones=zeros(1,10);
OVintersecciones(1)=tipointer2;
OVintersecciones(2)=calinter;
OVintersecciones(3)=pendiente;
OVintersecciones(4)=alumbrado1;
OVintersecciones(5)=resdeslizamiento2;
OVintersecciones(6)=distvisual;
OVintersecciones(7)=caninter; 
OVintersecciones(8)=gestvelo;
OVintersecciones(9)=tipointer3;
OVintersecciones(10)=velointer

OVintersecciones2=y.Factores5

if x(25)==11
    Reduccion_total_MGL4=0;
else    
for i4=1:length(OVintersecciones)
    p4(i4+1)=((OVintersecciones(i4)-OVintersecciones2(i4))*100)/((OVintersecciones(i4)));
end
OVintersecciones3=p4(2:end);
TF4 = isnan(OVintersecciones3);
OVintersecciones3(TF4) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j4=1:length(OVintersecciones3)
    q4(j4+1)=MLG*(OVintersecciones3(j4)/100);
end
OVintersecciones4=q4(2:end);
Total4=sum(OVintersecciones4);

%Reducción MGL - Método multiplicativo
for k4=1:length(OVintersecciones4)
    s4(k4+1)=1-(OVintersecciones3(k4)/100);
end
OVintersecciones5=s4(2:end);
MLG_anual4=MLG*(1-(prod(OVintersecciones5)));

%Factor de corrección de multiples medidas de mejora
FCAC4=MLG_anual4/Total4;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h4=1:length(OVintersecciones5)
    t4(h4+1)=OVintersecciones4(h4)*FCAC4;
end
OVintersecciones6=t4(2:end);
Reduccion_total_MGL4=sum(OVintersecciones6);
TF4x = isnan(Reduccion_total_MGL4);
Reduccion_total_MGL4(TF4x) = 0;
end
%-----Puntos de acceso a propiedades
%Factores de los atributos codificados
%Tipo de mediana
if tipomedian==0
 tipomediana4=0;
elseif tipomedian==1
 tipomediana4=tipomediana(1,4);
elseif tipomedian==2
 tipomediana4=tipomediana(1,4);
elseif tipomedian==3
 tipomediana4=tipomediana(1,4);
elseif tipomedian==4
 tipomediana4=tipomediana(1,4);
elseif tipomedian==5
 tipomediana4=tipomediana(1,4);
elseif tipomedian==6
 tipomediana4=tipomediana(1,4);
elseif tipomedian==7
 tipomediana4=tipomediana(1,4);
elseif tipomedian==8
 tipomediana4=tipomediana(1,4);
elseif tipomedian==9
 tipomediana4=tipomediana(1,4);
elseif tipomedian==10
 tipomediana4=tipomediana(1,4);
elseif tipomedian==11
 tipomediana4=tipomediana(1,4);
elseif tipomedian==12
 tipomediana4=tipomediana(1,4);
elseif tipomedian==13
 tipomediana4=tipomediana(1,4);
elseif tipomedian==14
 tipomediana4=tipomediana(1,4);
else tipomedian==15
 tipomediana4=tipomediana(1,4);
end

%Via de servicio
vacces=x(22);
if vacces==0
    vacceso=0;
elseif vacces==1 %Ausente
    vacceso=1.5;
else vacces==2 %
        vacceso=1;
end

%Puntos de acceso
T19=[2 50;1.3 50;1.1 50;1 0];
puntacces=x(29);
if puntacces==0
    puntacceso=0;
end
if puntacces==1 %Acceso comercial 1+
    for i=1:2
    puntacceso(1,i)=T19(1,i);
    end
end
if puntacces==2 %Acceso residencial >=3
    for i=1:2
    puntacceso(1,i)=T19(2,i);
    end
end
if puntacces==3 %Acceso residencial <3
    for i=1:2
    puntacceso(1,i)=T19(3,i);
    end
end
if puntacces==4 %Ninguno
    for i=1:2
    puntacceso(1,i)=T19(4,i);
    end
end
if puntacces==0
    puntacceso1=0;
elseif puntacces==1
    puntacceso1=puntacceso(1,1);
elseif puntacces==2
    puntacceso1=puntacceso(1,1);
elseif puntacces==3
    puntacceso1=puntacceso(1,1);
else puntacces==4
    puntacceso1=puntacceso(1,1);
end
if puntacces==0
    puntacceso2=0;
elseif puntacces==1
    puntacceso2=puntacceso(1,2);
elseif puntacces==2
    puntacceso2=puntacceso(1,2);
elseif puntacces==3
    puntacceso2=puntacceso(1,2);
else puntacces==4
    puntacceso2=puntacceso(1,2);
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
OVpuntosacceso=zeros(1,5);
OVpuntosacceso(1)=puntacceso1;
OVpuntosacceso(2)=vacceso;
OVpuntosacceso(3)=tipomediana4;
OVpuntosacceso(4)=puntacceso2;
OVpuntosacceso(5)=veloperacion 

OVpuntosacceso2=y.Factores6
if x(29)==4
    Reduccion_total_MGL5=0;
else
for i5=1:length(OVpuntosacceso)
    p5(i5+1)=((OVpuntosacceso(i5)-OVpuntosacceso2(i5))*100)/((OVpuntosacceso(i5)));
end
OVpuntosacceso3=p5(2:end);
TF5 = isnan(OVpuntosacceso3);
OVpuntosacceso3(TF5) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j5=1:length(OVpuntosacceso3)
    q5(j5+1)=MLG*(OVpuntosacceso3(j5)/100);
end
OVpuntosacceso4=q5(2:end);
Total5=sum(OVpuntosacceso4);

%Reducción MGL - Método multiplicativo
for k5=1:length(OVpuntosacceso4)
    s5(k5+1)=1-(OVpuntosacceso3(k5)/100);
end
OVpuntosacceso5=s5(2:end);
MLG_anual5=MLG*(1-(prod(OVpuntosacceso5)));

%Factor de corrección de multiples medidas de mejora
FCAC5=MLG_anual5/Total5;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h5=1:length(OVpuntosacceso5)
    t5(h5+1)=OVpuntosacceso4(h5)*FCAC5;
end
OVpuntosacceso6=t5(2:end);
Reduccion_total_MGL5=sum(OVpuntosacceso6);
TF5x = isnan(Reduccion_total_MGL5);
Reduccion_total_MGL5(TF5x) = 0;
end
%Clasificacion para motociclistas
%Salida del camino -----lado del conducto
if curvatur==0
    curvatura3=0;
elseif curvatur==1
    curvatura3=curvatura(1,2);
elseif curvatur==2
    curvatura3=curvatura(1,2);
elseif curvatur==3
    curvatura3=curvatura(1,2);
else curvatur==4
    curvatura3=curvatura(1,2);
end
if calidadcurv==0
    calidadcurva3=0;
elseif calidadcurv==1
    calidadcurva3=calidadcurva(1,2);
elseif calidadcurv==2
    calidadcurva3=calidadcurva(1,2);
else calidadcurv==3
    calidadcurva3=calidadcurva(1,2);
end

if estadosuperfici==0
    estadosuperficie3=0;
elseif estadosuperfici==1
    estadosuperficie3=estadosuperficie(1,2);
elseif estadosuperfici==2
    estadosuperficie3=estadosuperficie(1,2);
else estadosuperfici==3
    estadosuperficie3=estadosuperficie(1,2);
end

if resdeslizamient==0
   resdeslizamiento3=0;
elseif resdeslizamient==1
   resdeslizamiento3=resdeslizamiento(1,2);
elseif resdeslizamient==2
   resdeslizamiento3=resdeslizamiento(1,2);
elseif resdeslizamient==3
   resdeslizamiento3=resdeslizamiento(1,2);
elseif resdeslizamient==4
   resdeslizamiento3=resdeslizamiento(1,2);
else resdeslizamient==5
   resdeslizamiento3=resdeslizamiento(1,2);
end

if distconducto==0
  distconductor3=0;
elseif distconducto==1
  distconductor3=distconductor(1,2);
elseif distconducto==2
  distconductor3=distconductor(1,2);
elseif distconducto==3
  distconductor3=distconductor(1,2);
else distconducto==4
  distconductor3=distconductor(1,2);
end
if objconducto==0
 objconductor3=0;
elseif objconducto==1
 objconductor3=objconductor(1,2);
elseif objconducto==2
 objconductor3=objconductor(1,2);
elseif objconducto==3
 objconductor3=objconductor(1,2);
elseif objconducto==4
 objconductor3=objconductor(1,2);
elseif objconducto==5
 objconductor3=objconductor(1,2);
elseif objconducto==6
 objconductor3=objconductor(1,2);
elseif objconducto==7
 objconductor3=objconductor(1,2);
elseif objconducto==8
 objconductor3=objconductor(1,2);
elseif objconducto==9
 objconductor3=objconductor(1,2);
elseif objconducto==10
 objconductor3=objconductor(1,2);
elseif objconducto==11
 objconductor3=objconductor(1,2);
elseif objconducto==12
 objconductor3=objconductor(1,2);
elseif objconducto==13
 objconductor3=objconductor(1,2);
elseif objconducto==14
 objconductor3=objconductor(1,2);
elseif objconducto==15
 objconductor3=objconductor(1,2);
elseif objconducto==16
 objconductor3=objconductor(1,2);
else objconducto==17
 objconductor3=objconductor(1,2);
end
if anchoespaldo==0
  anchoespaldon3=0;
elseif anchoespaldo==1
  anchoespaldon3=anchoespaldon(1,1);
elseif anchoespaldo==2
  anchoespaldon3=anchoespaldon(1,1);
elseif anchoespaldo==3
  anchoespaldon3=anchoespaldon(1,1);
else anchoespaldo==4
  anchoespaldon3=anchoespaldon(1,1);
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
Motosalidacaminoconductor=zeros(1,12);
Motosalidacaminoconductor(1)=anchocarril;
Motosalidacaminoconductor(2)=curvatura3;
Motosalidacaminoconductor(3)=calidadcurva3;
Motosalidacaminoconductor(4)=delineacion;
Motosalidacaminoconductor(5)=bandasonoraes;
Motosalidacaminoconductor(6)=estadosuperficie3;
Motosalidacaminoconductor(7)=pendiente;
Motosalidacaminoconductor(8)=resdeslizamiento3;
Motosalidacaminoconductor(9)=objconductor3;
Motosalidacaminoconductor(10)=distconductor3;
Motosalidacaminoconductor(11)=anchoespaldon2;
Motosalidacaminoconductor(12)=velosalida

Motosalidacaminoconductor2=y.Factores7

for i6=1:length(Motosalidacaminoconductor)
    p6(i6+1)=((Motosalidacaminoconductor(i6)-Motosalidacaminoconductor2(i6))*100)/((Motosalidacaminoconductor(i6)));
end
Motosalidacaminoconductor3=p6(2:end);
TF6 = isnan(Motosalidacaminoconductor3);
Motosalidacaminoconductor3(TF6) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j6=1:length(Motosalidacaminoconductor3)
    q6(j6+1)=MLG*(Motosalidacaminoconductor3(j6)/100);
end
Motosalidacaminoconductor4=q6(2:end);
Total6=sum(Motosalidacaminoconductor4);

%Reducción MGL - Método multiplicativo
for k6=1:length(Motosalidacaminoconductor4)
    s6(k6+1)=1-(Motosalidacaminoconductor3(k6)/100);
end
Motosalidacaminoconductor5=s6(2:end);
MLG_anual6=MLG*(1-(prod(Motosalidacaminoconductor5)));

%Factor de corrección de multiples medidas de mejora
FCAC6=MLG_anual6/Total6;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h6=1:length(Motosalidacaminoconductor5)
    t6(h6+1)=Motosalidacaminoconductor4(h6)*FCAC6;
end
Motosalidacaminoconductor6=t6(2:end);
Reduccion_total_MGL6=sum(Motosalidacaminoconductor6);
TF6x = isnan(Reduccion_total_MGL6);
Reduccion_total_MGL6(TF6x) = 0;

%%Salida del camino ----lado del copiloto---
if distcopilot==0
  distcopiloto3=0;
elseif distcopilot==1
  distcopiloto3=distcopiloto(1,2);
elseif distcopilot==2
  distcopiloto3=distcopiloto(1,2);
elseif distcopilot==3
  distcopiloto3=distcopiloto(1,2);
else distcopilot==4
  distcopiloto3=distcopiloto(1,2);
end
if objcopilot==0
 objcopiloto3=0;
elseif objcopilot==1
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==2
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==3
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==4
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==5
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==6
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==7
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==8
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==9
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==10
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==11
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==12
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==13
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==14
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==15
 objcopiloto3=objcopiloto(1,2);
elseif objcopilot==16
 objcopiloto3=objcopiloto(1,2);
else objcopilot==17
 objcopiloto3=objcopiloto(1,2);
end
if anchoespaldonco==0
  anchoespaldoncop3=0;
elseif anchoespaldonco==1
  anchoespaldoncop3=anchoespaldoncop(1,1);
elseif anchoespaldonco==2
  anchoespaldoncop3=anchoespaldoncop(1,1);
elseif anchoespaldonco==3
  anchoespaldoncop3=anchoespaldoncop(1,1);
else anchoespaldonco==4
  anchoespaldoncop3=anchoespaldoncop(1,1);
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
Motosalidacaminocopiloto=zeros(1,12);
Motosalidacaminocopiloto(1)=anchocarril;
Motosalidacaminocopiloto(2)=curvatura3;
Motosalidacaminocopiloto(3)=calidadcurva3;
Motosalidacaminocopiloto(4)=delineacion;
Motosalidacaminocopiloto(5)=bandasonoraes;
Motosalidacaminocopiloto(6)=estadosuperficie3;
Motosalidacaminocopiloto(7)=pendiente;
Motosalidacaminocopiloto(8)=resdeslizamiento3;
Motosalidacaminocopiloto(9)=objcopiloto3;
Motosalidacaminocopiloto(10)=distcopiloto3;
Motosalidacaminocopiloto(11)=anchoespaldoncop3;
Motosalidacaminocopiloto(12)=velosalida

Motosalidacaminocopiloto2=y.Factores8

for i7=1:length(Motosalidacaminocopiloto)
    p7(i7+1)=((Motosalidacaminocopiloto(i7)-Motosalidacaminocopiloto2(i7))*100)/((Motosalidacaminocopiloto(i7)));
end
Motosalidacaminocopiloto3=p7(2:end);
TF7 = isnan(Motosalidacaminocopiloto3);
Motosalidacaminocopiloto3(TF7) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j7=1:length(Motosalidacaminocopiloto3)
    q7(j7+1)=MLG*(Motosalidacaminocopiloto3(j7)/100);
end
Motosalidacaminocopiloto4=q7(2:end);
Total7=sum(Motosalidacaminocopiloto4);

%Reducción MGL - Método multiplicativo
for k7=1:length(Motosalidacaminocopiloto4)
    s7(k7+1)=1-(Motosalidacaminocopiloto3(k7)/100);
end
Motosalidacaminocopiloto5=s7(2:end);
MLG_anual7=MLG*(1-(prod(Motosalidacaminocopiloto5)));

%Factor de corrección de multiples medidas de mejora
FCAC7=MLG_anual7/Total7;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h7=1:length(Motosalidacaminocopiloto5)
    t7(h7+1)=Motosalidacaminocopiloto4(h7)*FCAC7;
end
Motosalidacaminocopiloto6=t7(2:end);
Reduccion_total_MGL7=sum(Motosalidacaminocopiloto6);
TF7x = isnan(Reduccion_total_MGL7);
Reduccion_total_MGL7(TF7x) = 0;

%Frontal (pérdida del control) 
%Reducción prevista de los MLG (si la medida se instalara por si sola)
Motoperdidacontrol=zeros(1,10);
Motoperdidacontrol(1)=anchocarril;
Motoperdidacontrol(2)=curvatura3;
Motoperdidacontrol(3)=calidadcurva3;
Motoperdidacontrol(4)=delineacion;
Motoperdidacontrol(5)=bandassonoras;
Motoperdidacontrol(6)=estadosuperficie3;
Motoperdidacontrol(7)=pendiente;
Motoperdidacontrol(8)=resdeslizamiento3;
Motoperdidacontrol(9)=tipomediana2;
Motoperdidacontrol(10)=veloperacion1

Motoperdidacontrol2=y.Factores9

for i8=1:length(Motoperdidacontrol)
    p8(i8+1)=((Motoperdidacontrol(i8)-Motoperdidacontrol2(i8))*100)/((Motoperdidacontrol(i8)));
end
Motoperdidacontrol3=p8(2:end);
TF8 = isnan(Motoperdidacontrol3);
Motoperdidacontrol3(TF8) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j8=1:length(Motoperdidacontrol3)
    q8(j8+1)=MLG*(Motoperdidacontrol3(j8)/100);
end
Motoperdidacontrol4=q8(2:end);
Total8=sum(Motoperdidacontrol4);

%Reducción MGL - Método multiplicativo
for k8=1:length(Motoperdidacontrol4)
    s8(k8+1)=1-(Motoperdidacontrol3(k8)/100);
end
Motoperdidacontrol5=s8(2:end);
MLG_anual8=MLG*(1-(prod(Motoperdidacontrol5)));

%Factor de corrección de multiples medidas de mejora
FCAC8=MLG_anual8/Total8;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h8=1:length(Motoperdidacontrol5)
    t8(h8+1)=Motoperdidacontrol4(h8)*FCAC8;
end
Motoperdidacontrol6=t8(2:end);
Reduccion_total_MGL8=sum(Motoperdidacontrol6);
TF8x = isnan(Reduccion_total_MGL8);
Reduccion_total_MGL8(TF8x) = 0;

%%Frontal (Adelantamiento)
%Reducción prevista de los MLG (si la medida se instalara por si sola)
Motoadelantemiento=zeros(1,6);
Motoadelantemiento(1)=ncarriles2;
Motoadelantemiento(2)=pendiente;
Motoadelantemiento(3)=resdeslizamiento3;
Motoadelantemiento(4)=velodiferencial;
Motoadelantemiento(5)=tipomediana3; 
Motoadelantemiento(6)=veloperacion

Motoadelantemiento2=y.Factores10

for i9=1:length(Motoadelantemiento)
    p9(i9+1)=((Motoadelantemiento(i9)-Motoadelantemiento2(i9))*100)/((Motoadelantemiento(i9)));
end
Motoadelantemiento3=p9(2:end);
TF9 = isnan(Motoadelantemiento3);
Motoadelantemiento3(TF9) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j9=1:length(Motoadelantemiento3)
    q9(j9+1)=MLG*(Motoadelantemiento3(j9)/100);
end
Motoadelantemiento4=q9(2:end);
Total9=sum(Motoadelantemiento4);

%Reducción MGL - Método multiplicativo
for k9=1:length(Motoadelantemiento4)
    s9(k9+1)=1-(Motoadelantemiento3(k9)/100);
end
Motoadelantemiento5=s9(2:end);
MLG_anual9=MLG*(1-(prod(Motoadelantemiento5)));

%Factor de corrección de multiples medidas de mejora
FCAC9=MLG_anual9/Total9;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h9=1:length(Motoadelantemiento5)
    t9(h9+1)=Motoadelantemiento4(h9)*FCAC9;
end
Motoadelantemiento6=t9(2:end);
Reduccion_total_MGL9=sum(Motoadelantemiento6);
TF9x = isnan(Reduccion_total_MGL9);
Reduccion_total_MGL9(TF9x) = 0;

%%Interseccion
if tipointe==0
    tipointer4=0;
elseif tipointe==1
    tipointer4=tipointer(1,5);
elseif tipointe==2
    tipointer4=tipointer(1,5);
elseif tipointe==3
    tipointer4=tipointer(1,5);
elseif tipointe==4
    tipointer4=tipointer(1,5);
elseif tipointe==5
    tipointer4=tipointer(1,5);
elseif tipointe==6
    tipointer4=tipointer(1,5);
elseif tipointe==7
    tipointer4=tipointer(1,5);
elseif tipointe==8
    tipointer4=tipointer(1,5);
elseif tipointe==9
    tipointer4=tipointer(1,5);
elseif tipointe==10
    tipointer4=tipointer(1,5);
elseif tipointe==11
    tipointer4=tipointer(1,5);
elseif tipointe==12
    tipointer4=tipointer(1,5);
elseif tipointe==13
    tipointer4=tipointer(1,5);
elseif tipointe==14
    tipointer4=tipointer(1,5);
elseif tipointe==15
    tipointer4=tipointer(1,5);
else tipointe==16
    tipointer4=tipointer(1,5);
end

if tipointe==0
    tipointer5=0;
elseif tipointe==1
    tipointer5=tipointer(1,6);
elseif tipointe==2
    tipointer5=tipointer(1,6);
elseif tipointe==3
    tipointer5=tipointer(1,6);
elseif tipointe==4
    tipointer5=tipointer(1,6);
elseif tipointe==5
    tipointer5=tipointer(1,6);
elseif tipointe==6
    tipointer5=tipointer(1,6);
elseif tipointe==7
    tipointer5=tipointer(1,6);
elseif tipointe==8
    tipointer5=tipointer(1,6);
elseif tipointe==9
    tipointer5=tipointer(1,6);
elseif tipointe==10
    tipointer5=tipointer(1,6);
elseif tipointe==11
    tipointer5=tipointer(1,6);
elseif tipointe==12
    tipointer5=tipointer(1,6);
elseif tipointe==13
    tipointer5=tipointer(1,6);
elseif tipointe==14
    tipointer5=tipointer(1,6);
elseif tipointe==15
    tipointer5=tipointer(1,6);
else tipointe==16
    tipointer5=tipointer(1,6);
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
Motointersecciones=zeros(1,10);
Motointersecciones(1)=tipointer4;
Motointersecciones(2)=calinter;
Motointersecciones(3)=pendiente;
Motointersecciones(4)=alumbrado1;
Motointersecciones(5)=resdeslizamiento3;
Motointersecciones(6)=distvisual;
Motointersecciones(7)=caninter; 
Motointersecciones(8)=gestvelo;
Motointersecciones(9)=tipointer5;
Motointersecciones(10)=velointer 

Motointersecciones2=y.Factores11
if x(25)==11
    Reduccion_total_MGL10=0;
else
for i10=1:length(Motointersecciones)
    p10(i10+1)=((Motointersecciones(i10)-Motointersecciones2(i10))*100)/((Motointersecciones(i10)));
end
Motointersecciones3=p10(2:end);
TF10 = isnan(Motointersecciones3);
Motointersecciones3(TF10) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j10=1:length(Motointersecciones3)
    q10(j10+1)=MLG*(Motointersecciones3(j10)/100);
end
Motointersecciones4=q10(2:end);
Total10=sum(Motointersecciones4);

%Reducción MGL - Método multiplicativo
for k10=1:length(Motointersecciones4)
    s10(k10+1)=1-(Motointersecciones3(k10)/100);
end
Motointersecciones5=s10(2:end);
MLG_anual10=MLG*(1-(prod(Motointersecciones5)));

%Factor de corrección de multiples medidas de mejora
FCAC10=MLG_anual10/Total10;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h10=1:length(Motointersecciones5)
    t10(h10+1)=Motointersecciones4(h10)*FCAC10;
end
Motointersecciones6=t10(2:end);
Reduccion_total_MGL10=sum(Motointersecciones6);
TF10x = isnan(Reduccion_total_MGL10);
Reduccion_total_MGL10(TF10x) = 0;
end
%%Acceso a propiedades
%Reducción prevista de los MLG (si la medida se instalara por si sola)
Motopuntosacceso=zeros(1,4);
Motopuntosacceso(1)=puntacceso1;
Motopuntosacceso(2)=vacceso;
Motopuntosacceso(3)=puntacceso2;
Motopuntosacceso(4)=veloperacion 

Motopuntosacceso2=y.Factores12
if x(29)==4
    Reduccion_total_MGL11=0;
else
for i11=1:length(Motopuntosacceso)
    p11(i11+1)=((Motopuntosacceso(i11)-Motopuntosacceso2(i11))*100)/((Motopuntosacceso(i11)));
end
Motopuntosacceso3=p11(2:end);
TF11 = isnan(Motopuntosacceso3);
Motopuntosacceso3(TF11) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j11=1:length(Motopuntosacceso3)
    q11(j11+1)=MLG*(Motopuntosacceso3(j11)/100);
end
Motopuntosacceso4=q11(2:end);
Total11=sum(Motopuntosacceso4);

%Reducción MGL - Método multiplicativo
for k11=1:length(Motopuntosacceso4)
    s11(k11+1)=1-(Motopuntosacceso3(k11)/100);
end
Motopuntosacceso5=s11(2:end);
MLG_anual11=MLG*(1-(prod(Motopuntosacceso5)));

%Factor de corrección de multiples medidas de mejora
FCAC11=MLG_anual11/Total11;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h11=1:length(Motopuntosacceso5)
    t11(h11+1)=Motopuntosacceso4(h11)*FCAC11;
end
Motopuntosacceso6=t11(2:end);
Reduccion_total_MGL11=sum(Motopuntosacceso6);
TF11x = isnan(Reduccion_total_MGL11);
Reduccion_total_MGL11(TF11x) = 0;
end
%%A lo largo
%Infraestructura para motocicletas
T20=[0 50;0.1 50;0 50;0.1 50;1 50;2 50];
infmot=x(45);
if infmot==0
    infmoto=0
end
if infmot==1
    for i=1:2
    infmoto(1,i)=T20(1,i)
    end
end
if infmot==2
    for i=1:2
    infmoto(1,i)=T20(2,i)
    end
end
if infmot==3
    for i=1:2
    infmoto(1,i)=T20(3,i)
    end
end
if infmot==4
    for i=1:2
    infmoto(1,i)=T20(4,i)
    end
end
if infmot==5
    for i=1:2
    infmoto(1,i)=T20(5,i)
    end
end
if infmot==6
    for i=1:2
    infmoto(1,i)=T20(6,i)
    end
end
if infmot==0
    infmoto1=0
elseif infmot==1
    infmoto1=infmoto(1,1)
elseif infmot==2
        infmoto1=infmoto(1,1)
elseif infmot==3
        infmoto1=infmoto(1,1)
elseif infmot==4
        infmoto1=infmoto(1,1)
elseif infmot==5
        infmoto1=infmoto(1,1)
else infmot==6
        infmoto1=infmoto(1,1)
end
if infmot==0
    infmoto2=0
elseif infmot==1
    infmoto2=infmoto(1,2)
elseif infmot==2
        infmoto2=infmoto(1,2)
elseif infmot==3
        infmoto2=infmoto(1,2)
elseif infmot==4
        infmoto2=infmoto(1,2)
elseif infmot==5
        infmoto2=infmoto(1,2)
else infmot==6
        infmoto2=infmoto(1,2)
end
%Reducción prevista de los MLG (si la medida se instalara por si sola)
Motoalolargo=zeros(1,3);
Motoalolargo(1)=infmoto1;
Motoalolargo(2)=infmoto2;
Motoalolargo(3)=veloperacion

Motoalolargo2=y.Factores13

for i12=1:length(Motoalolargo)
    p12(i12+1)=((Motoalolargo(i12)-Motoalolargo2(i12))*100)/((Motoalolargo(i12)));
end
Motoalolargo3=p12(2:end);
TF12 = isnan(Motoalolargo3);
Motoalolargo3(TF12) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j12=1:length(Motoalolargo3)
    q12(j12+1)=MLG*(Motoalolargo3(j12)/100);
end
Motoalolargo4=q12(2:end);
Total12=sum(Motoalolargo4);

%Reducción MGL - Método multiplicativo
for k12=1:length(Motoalolargo4)
    s12(k12+1)=1-(Motoalolargo3(k12)/100);
end
Motoalolargo5=s12(2:end);
MLG_anual12=MLG*(1-(prod(Motoalolargo5)));

%Factor de corrección de multiples medidas de mejora
FCAC12=MLG_anual12/Total12;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h12=1:length(Motoalolargo5)
    t12(h12+1)=Motoalolargo4(h12)*FCAC12;
end
Motoalolargo6=t12(2:end);
Reduccion_total_MGL12=sum(Motoalolargo6);
TF12x = isnan(Reduccion_total_MGL12);
Reduccion_total_MGL12(TF12x) = 0;

%Ciclistas
%A lo largo
%Infraestructura para bicicletas 
T21=[0 1 0;0.1 1 90;12 1 90;20 1.2 90;17 1.2 90;19 1 90;1 1 90];
infbic=x(46);
if infbic==0
    infbici=0;
end
if infbic==1
    for i=1:3
    infbici(1,i)=T21(1,i);
    end
end
if infbic==2
    for i=1:3
    infbici(1,i)=T21(2,i);
    end
end
if infbic==3
    for i=1:3
    infbici(1,i)=T21(3,i);
    end
end
if infbic==4
    for i=1:3
    infbici(1,i)=T21(4,i);
    end
end
if infbic==5
    for i=1:3
    infbici(1,i)=T21(5,i);
    end
end
if infbic==6
    for i=1:3
    infbici(1,i)=T21(6,i);
    end
end
if infbic==7
    for i=1:3
    infbici(1,i)=T21(7,i);
    end
end
if infbic==0
    infbici1=0;
elseif infbic==1
    infbici1=infbici(1,1);
elseif infbic==2
        infbici1=infbici(1,1);
elseif infbic==3
        infbici1=infbici(1,1);
elseif infbic==4
        infbici1=infbici(1,1);
elseif infbic==5
        infbici1=infbici(1,1);
elseif infbic==6
        infbici1=infbici(1,1);
else infbic==7
        infbici1=infbici(1,1);
end
%Estacionamiento de vehiculos
estve=x(21);
if estve==0
    estveh=0
elseif estve==1
    estveh=1
elseif estve==2
    estveh=1.2
else estve==3
    estveh=1.33
end
%Alumbrado público
if alumbrad==0
    alumbrado2=0;
elseif alumbrad==1
    alumbrado2=alumbrado(1,3);
else  alumbrad==2
   alumbrado2=alumbrado(1,3);
end
%Infraestrucrura bicicletas-severidad
if infbic==0
    infbici2=0;
elseif infbic==1
    infbici2=infbici(1,3);
elseif infbic==2
        infbici2=infbici(1,3);
elseif infbic==3
        infbici2=infbici(1,3);
elseif infbic==4
        infbici2=infbici(1,3);
elseif infbic==5
        infbici2=infbici(1,3);
elseif infbic==6
        infbici2=infbici(1,3);
else infbic==7
        infbici2=infbici(1,3);
end
%Velocidad de operacion (+10 km/h)
%veloperacio=x(52);
 if veloperaciom==150
        veloperacionbi=1;
 elseif veloperaciom==145
         veloperacionbi=0.97;
 elseif veloperaciom==140
         veloperacionbi=0.93;
 elseif veloperaciom==135
         veloperacionbi=0.9;
 elseif veloperaciom==130
         veloperacionbi=0.87;
 elseif veloperaciom==125
         veloperacionbi=0.83;
 elseif veloperaciom==120
        veloperacionbi=0.8;
 elseif veloperaciom==115
         veloperacionbi=0.77;
 elseif veloperaciom==110
         veloperacionbi=0.73;
 elseif veloperaciom==105
         veloperacionbi=0.7;
 elseif veloperaciom==100
         veloperacionbi=0.67;
 elseif veloperaciom==95
         veloperacionbi=0.63;  
 elseif veloperaciom==90
         veloperacionbi=0.53;
 elseif veloperaciom==85
         veloperacionbi=0.44;
 elseif veloperaciom==80
         veloperacionbi=0.36;
 elseif veloperaciom==75
         veloperacionbi=0.28;
 elseif veloperaciom==70
         veloperacionbi=0.22;
 elseif veloperaciom==65
         veloperacionbi=0.18;
 elseif veloperaciom==60
         veloperacionbi=0.14;
 elseif veloperaciom==55
         veloperacionbi=0.1;
 elseif veloperaciom==50
         veloperacionbi=0.07;
 elseif veloperaciom==45
         veloperacionbi=0.05;
 elseif veloperaciom==40
         veloperacionbi=0.03;
 elseif veloperaciom==35
         veloperacionbi=0.02;
 elseif veloperaciom==30
         veloperacionbi=0.01;
 else veloperaciom==0
         veloperacionbi=0;
 end
 
%Reducción prevista de los MLG (si la medida se instalara por si sola)
Ciclialolargo=zeros(1,15);
Ciclialolargo(1)=infbici1;
Ciclialolargo(2)=curvatura2;
Ciclialolargo(3)=calidadcurva3;
Ciclialolargo(4)=distvisual;
Ciclialolargo(5)=anchocarril;
Ciclialolargo(6)=delineacion;
Ciclialolargo(7)=pendiente;
Ciclialolargo(8)=estadosuperficie2;
Ciclialolargo(9)=gestvelo;
Ciclialolargo(10)=bandasonoraes;
Ciclialolargo(11)=estveh;
Ciclialolargo(12)=resdeslizamiento3;
Ciclialolargo(13)=alumbrado2;
Ciclialolargo(14)=infbici2;
Ciclialolargo(15)=veloperacionbi

Ciclialolargo2=y.Factores14

for i13=1:length(Ciclialolargo)
    p13(i13+1)=((Ciclialolargo(i13)-Ciclialolargo2(i13))*100)/((Ciclialolargo(i13)));
end
Ciclialolargo3=p13(2:end);
TF13 = isnan(Ciclialolargo3);
Ciclialolargo3(TF13) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j13=1:length(Ciclialolargo3)
    q13(j13+1)=MLG*(Ciclialolargo3(j13)/100);
end
Ciclialolargo4=q13(2:end);
Total13=sum(Ciclialolargo4);

%Reducción MGL - Método multiplicativo
for k13=1:length(Ciclialolargo4)
    s13(k13+1)=1-(Ciclialolargo3(k13)/100);
end
Ciclialolargo5=s13(2:end);
MLG_anual13=MLG*(1-(prod(Ciclialolargo5)));

%Factor de corrección de multiples medidas de mejora
FCAC13=MLG_anual13/Total13;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h13=1:length(Ciclialolargo5)
    t13(h13+1)=Ciclialolargo4(h13)*FCAC13;
end
Ciclialolargo6=t13(2:end);
Reduccion_total_MGL13=sum(Ciclialolargo6);
TF13x = isnan(Reduccion_total_MGL13);
Reduccion_total_MGL13(TF13x) = 0;

%Salidad del camino
%Estado de la vía
if estadosuperfici==0
    estadosuperficie5=0;
elseif estadosuperfici==1
    estadosuperficie5=estadosuperficie(1,5);
elseif estadosuperfici==2
    estadosuperficie5=estadosuperficie(1,5);
else estadosuperfici==3
    estadosuperficie5=estadosuperficie(1,5);
end
%Distancia al objeto lado del conductor
if distconducto==0
  distconductor4=0;
elseif distconducto==1
  distconductor4=distconductor(1,3);
elseif distconducto==2
  distconductor4=distconductor(1,3);
elseif distconducto==3
  distconductor4=distconductor(1,3);
else distconducto==4
  distconductor4=distconductor(1,3);
end
%Objeto lado del conductor
if objconducto==0
 objconductor4=0;
elseif objconducto==1
 objconductor4=objconductor(1,3);
elseif objconducto==2
 objconductor4=objconductor(1,3);
elseif objconducto==3
 objconductor4=objconductor(1,3);
elseif objconducto==4
 objconductor4=objconductor(1,3);
elseif objconducto==5
 objconductor4=objconductor(1,3);
elseif objconducto==6
 objconductor4=objconductor(1,3);
elseif objconducto==7
 objconductor4=objconductor(1,3);
elseif objconducto==8
 objconductor4=objconductor(1,3);
elseif objconducto==9
 objconductor4=objconductor(1,3);
elseif objconducto==10
 objconductor4=objconductor(1,3);
elseif objconducto==11
 objconductor4=objconductor(1,3);
elseif objconducto==12
 objconductor4=objconductor(1,3);
elseif objconducto==13
 objconductor4=objconductor(1,3);
elseif objconducto==14
 objconductor4=objconductor(1,3);
elseif objconducto==15
 objconductor4=objconductor(1,3);
elseif objconducto==16
 objconductor4=objconductor(1,3);
else objconducto==17
 objconductor4=objconductor(1,3);
end
%Distancia al objeto lado del copiloto
if distcopilot==0
  distcopiloto4=0;
elseif distcopilot==1
  distcopiloto4=distcopiloto(1,3);
elseif distcopilot==2
  distcopiloto4=distcopiloto(1,3);
elseif distcopilot==3
  distcopiloto4=distcopiloto(1,3);
else distcopilot==4
  distcopiloto4=distcopiloto(1,3);
end
%Objeto lado del copiloto
if objcopilot==0
 objcopiloto4=0;
elseif objcopilot==1
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==2
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==3
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==4
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==5
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==6
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==7
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==8
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==9
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==10
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==11
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==12
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==13
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==14
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==15
 objcopiloto4=objcopiloto(1,3);
elseif objcopilot==16
 objcopiloto4=objcopiloto(1,3);
else objcopilot==17
 objcopiloto4=objcopiloto(1,3);
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
Ciclisalidacamino=zeros(1,13);
Ciclisalidacamino(1)=anchocarril;
Ciclisalidacamino(2)=curvatura2;
Ciclisalidacamino(3)=calidadcurva3;
Ciclisalidacamino(4)=delineacion;
Ciclisalidacamino(5)=alumbrado2;
Ciclisalidacamino(6)=estadosuperficie5;
Ciclisalidacamino(7)=pendiente;
Ciclisalidacamino(8)=resdeslizamiento3;
Ciclisalidacamino(9)=objconductor4;
Ciclisalidacamino(10)=distconductor4;
Ciclisalidacamino(11)=objcopiloto4;
Ciclisalidacamino(12)=distcopiloto4;
Ciclisalidacamino(13)=veloperacionbi 

Ciclisalidacamino2=y.Factores15

for i14=1:length(Ciclisalidacamino)
    p14(i14+1)=((Ciclisalidacamino(i14)-Ciclisalidacamino2(i14))*100)/((Ciclisalidacamino(i14)));
end
Ciclisalidacamino3=p14(2:end);
TF14 = isnan(Ciclisalidacamino3);
Ciclisalidacamino3(TF14) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j14=1:length(Ciclisalidacamino3)
    q14(j14+1)=MLG*(Ciclisalidacamino3(j14)/100);
end
Ciclisalidacamino4=q14(2:end);
Total14=sum(Ciclisalidacamino4);

%Reducción MGL - Método multiplicativo
for k14=1:length(Ciclisalidacamino4)
    s14(k14+1)=1-(Ciclisalidacamino3(k14)/100);
end
Ciclisalidacamino5=s14(2:end);
MLG_anual14=MLG*(1-(prod(Ciclisalidacamino5)));

%Factor de corrección de multiples medidas de mejora
FCAC14=MLG_anual14/Total14;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h14=1:length(Ciclisalidacamino5)
    t14(h14+1)=Ciclisalidacamino4(h14)*FCAC14;
end
Ciclisalidacamino6=t14(2:end);
Reduccion_total_MGL14=sum(Ciclisalidacamino6);
TF14x = isnan(Reduccion_total_MGL14);
Reduccion_total_MGL14(TF14x) = 0;

%Intersección
if tipointe==0
    tipointer6=0;
elseif tipointe==1
    tipointer6=tipointer(1,4);
elseif tipointe==2
    tipointer6=tipointer(1,4);
elseif tipointe==3
    tipointer6=tipointer(1,4);
elseif tipointe==4
    tipointer6=tipointer(1,4);
elseif tipointe==5
    tipointer6=tipointer(1,4);
elseif tipointe==6
    tipointer6=tipointer(1,4);
elseif tipointe==7
    tipointer6=tipointer(1,4);
elseif tipointe==8
    tipointer6=tipointer(1,4);
elseif tipointe==9
    tipointer6=tipointer(1,4);
elseif tipointe==10
    tipointer6=tipointer(1,4);
elseif tipointe==11
    tipointer6=tipointer(1,4);
elseif tipointe==12
    tipointer6=tipointer(1,4);
elseif tipointe==13
    tipointer6=tipointer(1,4);
elseif tipointe==14
    tipointer6=tipointer(1,4);
elseif tipointe==15
    tipointer6=tipointer(1,4);
else tipointe==16
    tipointer6=tipointer(1,4);
end
%Infraestructura de bicicletas
if infbic==0
    infbici3=0;
elseif infbic==1
    infbici3=infbici(1,2);
elseif infbic==2
        infbici3=infbici(1,2);
elseif infbic==3
        infbici3=infbici(1,2);
elseif infbic==4
        infbici3=infbici(1,2);
elseif infbic==5
        infbici3=infbici(1,2);
elseif infbic==6
        infbici3=infbici(1,2);
else infbic==7
        infbici3=infbici(1,2);
end

%Infraestructura para cruce peatonal ---intersecciones---vía lateral
supescolar=x(48)
T40=[0.4 0.3 0.4;1 0.95 1;1.25 1.2 1.25;3.8 1 3.8;4.8 1.25 4.8;5.1 3.8 5.1;6.7 4.8 5.1;2.5 1 2.5;3.2 1 3.2;3.4 2.5 3.4;4.5 3.2 4.5];
infcrucepeint=x(41)
if infcrucepeint==0 && supescolar==3
    infcrucepint=0;
elseif infcrucepeint==1 && supescolar==3
    infcrucepint=0.4;
elseif infcrucepeint==2 && supescolar==3
    infcrucepint=1;
elseif infcrucepeint==3 && supescolar==3
    infcrucepint=1.25;
elseif infcrucepeint==4 && supescolar==3
    infcrucepint=3.8;
elseif infcrucepeint==5 && supescolar==3
    infcrucepint=4.8;
elseif infcrucepeint==6 && supescolar==3
    infcrucepint=5.1;
elseif infcrucepeint==7 && supescolar==3
    infcrucepint=6.7;        
elseif infcrucepeint==8 && supescolar==3
    infcrucepint=2.5;    
elseif infcrucepeint==9 && supescolar==3
    infcrucepint=3.2;   
elseif infcrucepeint==10 && supescolar==3
    infcrucepint=3.4;    
elseif infcrucepeint==11 && supescolar==3
    infcrucepint=4.5;    
end
if infcrucepeint==0 && supescolar==1
    infcrucepint=0;
elseif infcrucepeint==1 && supescolar==1
    infcrucepint=0.3;
elseif infcrucepeint==2 && supescolar==1
    infcrucepint=0.95;
elseif infcrucepeint==3 && supescolar==1
    infcrucepint=1.2;
elseif infcrucepeint==4 && supescolar==1
    infcrucepint=1;
elseif infcrucepeint==5 && supescolar==1
    infcrucepint=1.25;
elseif infcrucepeint==6 && supescolar==1
    infcrucepint=3.8;
elseif infcrucepeint==7 && supescolar==1
    infcrucepint=4.8;        
elseif infcrucepeint==8 && supescolar==1
    infcrucepint=1;    
elseif infcrucepeint==9 && supescolar==1
    infcrucepint=1;   
elseif infcrucepeint==10 && supescolar==1
    infcrucepint=2.5;    
elseif infcrucepeint==11 && supescolar==1
    infcrucepint=3.2;    
end
if infcrucepeint==0 && supescolar==2
    infcrucepint=0;
elseif infcrucepeint==1 && supescolar==2
    infcrucepint=0.4;
elseif infcrucepeint==2 && supescolar==2
    infcrucepint=1;
elseif infcrucepeint==3 && supescolar==2
    infcrucepint=1.25;
elseif infcrucepeint==4 && supescolar==2
    infcrucepint=3.8;
elseif infcrucepeint==5 && supescolar==2
    infcrucepint=4.8;
elseif infcrucepeint==6 && supescolar==2
    infcrucepint=5.1;
elseif infcrucepeint==7 && supescolar==2
    infcrucepint=6.7;        
elseif infcrucepeint==8 && supescolar==2
    infcrucepint=2.5;    
elseif infcrucepeint==9 && supescolar==2
    infcrucepint=3.2;   
elseif infcrucepeint==10 && supescolar==2
    infcrucepint=3.4;    
elseif infcrucepeint==11 && supescolar==2
    infcrucepint=4.5;    
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
Cicliinterseccion=zeros(1,12);
Cicliinterseccion(1)=tipointer6;
Cicliinterseccion(2)=calinter;
Cicliinterseccion(3)=pendiente;
Cicliinterseccion(4)=resdeslizamiento3;
Cicliinterseccion(5)=infbici3;
Cicliinterseccion(6)=alumbrado2;
Cicliinterseccion(7)=distvisual;
Cicliinterseccion(8)=caninter;
Cicliinterseccion(9)=gestvelo;
Cicliinterseccion(10)=infcrucepint;
Cicliinterseccion(11)=tipointer5;
Cicliinterseccion(12)=veloperacionbi

Cicliinterseccion2=y.Factores16
if x(25)==11
    Reduccion_total_MGL15=0;
else
for i15=1:length(Cicliinterseccion)
    p15(i15+1)=((Cicliinterseccion(i15)-Cicliinterseccion2(i15))*100)/((Cicliinterseccion(i15)));
end
Cicliinterseccion3=p15(2:end);
TF15 = isnan(Cicliinterseccion3);
Cicliinterseccion3(TF15) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j15=1:length(Cicliinterseccion3)
    q15(j15+1)=MLG*(Cicliinterseccion3(j15)/100);
end
Cicliinterseccion4=q15(2:end);
Total15=sum(Cicliinterseccion4);

%Reducción MGL - Método multiplicativo
for k15=1:length(Cicliinterseccion4)
    s15(k15+1)=1-(Cicliinterseccion3(k15)/100);
end
Cicliinterseccion5=s15(2:end);
MLG_anual15=MLG*(1-(prod(Cicliinterseccion5)));

%Factor de corrección de multiples medidas de mejora
FCAC15=MLG_anual15/Total15;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h15=1:length(Cicliinterseccion5)
    t15(h15+1)=Cicliinterseccion4(h15)*FCAC15;
end
Cicliinterseccion6=t15(2:end);
Reduccion_total_MGL15=sum(Cicliinterseccion6);
TF15x = isnan(Reduccion_total_MGL15);
Reduccion_total_MGL15(TF15x) = 0;
end
%Peatones
%A lo largo (lado del conductor) 
%Acera-lado de conductor --probabilidad
T22=[0 90;0.075 90;0.09 90;0.1 90;20 90;5 90;6 90];
aceconducto=x(43);
if aceconducto==0
    aceconductor=0
end
if aceconducto==1
    for i=1:2
    aceconductor(1,i)=T22(1,i)
    end
end
if aceconducto==2
    for i=1:2
    aceconductor(1,i)=T22(2,i)
    end
end
if aceconducto==3
    for i=1:2
    aceconductor(1,i)=T22(3,i)
    end
end
if aceconducto==4
    for i=1:2
    aceconductor(1,i)=T22(4,i)
    end
end
if aceconducto==5
    for i=1:2
    aceconductor(1,i)=T22(5,i)
    end
end
if aceconducto==6
    for i=1:2
    aceconductor(1,i)=T22(6,i)
    end
end
if aceconducto==7
    for i=1:2
    aceconductor(1,i)=T22(7,i)
    end
end
if aceconducto==0
    aceconductor1=0;
elseif aceconducto==1
    aceconductor1=aceconductor(1,1);
elseif aceconducto==2
        aceconductor1=aceconductor(1,1);
elseif aceconducto==3
        aceconductor1=aceconductor(1,1);
elseif aceconducto==4
        aceconductor1=aceconductor(1,1);
elseif aceconducto==5
        aceconductor1=aceconductor(1,1);
elseif aceconducto==6
        aceconductor1=aceconductor(1,1);
else aceconducto==7
        aceconductor1=aceconductor(1,1);
end
%Acera-lado de conductor --severidad
if aceconducto==0
    aceconductor2=0;
elseif aceconducto==1
    aceconductor2=aceconductor(1,2);
elseif aceconducto==2
        aceconductor2=aceconductor(1,2);
elseif aceconducto==3
        aceconductor2=aceconductor(1,2);
elseif aceconducto==4
        aceconductor2=aceconductor(1,2);
elseif aceconducto==5
        aceconductor2=aceconductor(1,2);
elseif aceconducto==6
        aceconductor2=aceconductor(1,2);
else aceconducto==7
        aceconductor2=aceconductor(1,2);
end

%Velocidad de operacion (+10 km/h)
%veloperacio=x(52);
 if veloperaciom==150
        veloperacionpe=1;
 elseif veloperaciom==145
         veloperacionpe=0.97;
 elseif veloperaciom==140
         veloperacionpe=0.93;
 elseif veloperaciom==135
         veloperacionpe=0.9;
 elseif veloperaciom==130
         veloperacionpe=0.87;
 elseif veloperaciom==125
         veloperacionpe=0.83;
 elseif veloperaciom==120
        veloperacionpe=0.8;
 elseif veloperaciom==115
         veloperacionpe=0.77;
 elseif veloperaciom==110
         veloperacionpe=0.73;
 elseif veloperaciom==105
         veloperacionpe=0.7;
 elseif veloperaciom==100
         veloperacionpe=0.67;
 elseif veloperaciom==95
         veloperacionpe=0.63;  
 elseif veloperaciom==90
         veloperacionpe=0.6;
 elseif veloperaciom==85
         veloperacionpe=0.57;
 elseif veloperaciom==80
         veloperacionpe=0.53;
 elseif veloperaciom==75
         veloperacionpe=0.46;
 elseif veloperaciom==70
         veloperacionpe=0.38;
 elseif veloperaciom==65
         veloperacionpe=0.3;
 elseif veloperaciom==60
         veloperacionpe=0.22;
 elseif veloperaciom==55
         veloperacionpe=0.16; 
 elseif veloperaciom==50
         veloperacionpe=0.12; %0.16
 elseif veloperaciom==45
         veloperacionpe=0.08;
 elseif veloperaciom==40
         veloperacionpe=0.05;
 elseif veloperaciom==35
         veloperacionpe=0.03;
 elseif veloperaciom==30
         veloperacionpe=0.01;
 else veloperaciom==0
         veloperacionpe=0;        
 end
 
 %Reducción prevista de los MLG (si la medida se instalara por si sola)
Peatonalolargoconductor=zeros(1,15);
Peatonalolargoconductor(1)=aceconductor1;
Peatonalolargoconductor(2)=curvatura3;
Peatonalolargoconductor(3)=calidadcurva2;
Peatonalolargoconductor(4)=distvisual;
Peatonalolargoconductor(5)=anchocarril;
Peatonalolargoconductor(6)=delineacion;
Peatonalolargoconductor(7)=pendiente;
Peatonalolargoconductor(8)=estadosuperficie2;
Peatonalolargoconductor(9)=gestvelo;
Peatonalolargoconductor(10)=estveh;
Peatonalolargoconductor(11)=bandasonoraes;
Peatonalolargoconductor(12)=alumbrado2;
Peatonalolargoconductor(13)=resdeslizamiento2;
Peatonalolargoconductor(14)=aceconductor2;
Peatonalolargoconductor(15)=veloperacionpe

Peatonalolargoconductor2=y.Factores17

for i16=1:length(Peatonalolargoconductor)
    p16(i16+1)=((Peatonalolargoconductor(i16)-Peatonalolargoconductor2(i16))*100)/((Peatonalolargoconductor(i16)));
end
Peatonalolargoconductor3=p16(2:end);
TF16 = isnan(Peatonalolargoconductor3);
Peatonalolargoconductor3(TF16) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j16=1:length(Peatonalolargoconductor3)
    q16(j16+1)=MLG*(Peatonalolargoconductor3(j16)/100);
end
Peatonalolargoconductor4=q16(2:end);
Total16=sum(Peatonalolargoconductor4);

%Reducción MGL - Método multiplicativo
for k16=1:length(Peatonalolargoconductor4)
    s16(k16+1)=1-(Peatonalolargoconductor3(k16)/100);
end
Peatonalolargoconductor5=s16(2:end);
MLG_anual16=MLG*(1-(prod(Peatonalolargoconductor5)));

%Factor de corrección de multiples medidas de mejora
FCAC16=MLG_anual16/Total16;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h16=1:length(Peatonalolargoconductor5)
    t16(h16+1)=Peatonalolargoconductor4(h16)*FCAC16;
end
Peatonalolargoconductor6=t16(2:end);
Reduccion_total_MGL16=sum(Peatonalolargoconductor6);
TF16x = isnan(Reduccion_total_MGL16);
Reduccion_total_MGL16(TF16x) = 0;

%A lo largo (lado del copiloto) 
%Acera-lado de copiloto--probabilidad
acecopilot=x(44);
if acecopilot==0
    acecopiloto=0
end
if acecopilot==1
    for i=1:2
    acecopiloto(1,i)=T22(1,i)
    end
end
if acecopilot==2
    for i=1:2
    acecopiloto(1,i)=T22(2,i)
    end
end
if acecopilot==3
    for i=1:2
    acecopiloto(1,i)=T22(3,i)
    end
end
if acecopilot==4
    for i=1:2
    acecopiloto(1,i)=T22(4,i)
    end
end
if acecopilot==5
    for i=1:2
    acecopiloto(1,i)=T22(5,i)
    end
end
if acecopilot==6
    for i=1:2
    acecopiloto(1,i)=T22(6,i)
    end
end
if acecopilot==7
    for i=1:2
    acecopiloto(1,i)=T22(7,i)
    end
end
if acecopilot==0
    acecopiloto1=0;
elseif acecopilot==1
    acecopiloto1=acecopiloto(1,1);
elseif acecopilot==2
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==3
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==4
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==5
        acecopiloto1=acecopiloto(1,1);
elseif acecopilot==6
        acecopiloto1=acecopiloto(1,1);
else acecopilot==7
        acecopiloto1=acecopiloto(1,1);
end

%Acera-lado de copiloto--severidad
if acecopilot==0
     acecopiloto2=0;
elseif acecopilot==1
     acecopiloto2=acecopiloto(1,2);
elseif acecopilot==2
        acecopiloto2=acecopiloto(1,2);
elseif acecopilot==3
        acecopiloto2=acecopiloto(1,2);
elseif acecopilot==4
        acecopiloto2=acecopiloto(1,2);
elseif acecopilot==5
        acecopiloto2=acecopiloto(1,2);
elseif acecopilot==6
        acecopiloto2=acecopiloto(1,2);
else acecopilot==7
        acecopiloto2=acecopiloto(1,2);
end

%Reducción prevista de los MLG (si la medida se instalara por si sola)
Peatonalolargocopiloto=zeros(1,15);
Peatonalolargocopiloto(1)=acecopiloto1;
Peatonalolargocopiloto(2)=curvatura3;
Peatonalolargocopiloto(3)=calidadcurva2;
Peatonalolargocopiloto(4)=distvisual;
Peatonalolargocopiloto(5)=anchocarril;
Peatonalolargocopiloto(6)=delineacion;
Peatonalolargocopiloto(7)=pendiente;
Peatonalolargocopiloto(8)=estadosuperficie2;
Peatonalolargocopiloto(9)=gestvelo;
Peatonalolargocopiloto(10)=estveh;
Peatonalolargocopiloto(11)=bandasonoraes;
Peatonalolargocopiloto(12)=alumbrado2;
Peatonalolargocopiloto(13)=resdeslizamiento2;
Peatonalolargocopiloto(14)=acecopiloto2;
Peatonalolargocopiloto(15)=veloperacionpe

Peatonalolargocopiloto2=y.Factores18

for i17=1:length(Peatonalolargocopiloto)
    p17(i17+1)=((Peatonalolargocopiloto(i17)-Peatonalolargocopiloto2(i17))*100)/((Peatonalolargocopiloto(i17)));
end
Peatonalolargocopiloto3=p17(2:end);
TF17 = isnan(Peatonalolargocopiloto3);
Peatonalolargocopiloto3(TF17) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j17=1:length(Peatonalolargocopiloto3)
    q17(j17+1)=MLG*(Peatonalolargocopiloto3(j17)/100);
end
Peatonalolargocopiloto4=q17(2:end);
Total17=sum(Peatonalolargocopiloto4);

%Reducción MGL - Método multiplicativo
for k17=1:length(Peatonalolargocopiloto4)
    s17(k17+1)=1-(Peatonalolargocopiloto3(k17)/100);
end
Peatonalolargocopiloto5=s17(2:end);
MLG_anual17=MLG*(1-(prod(Peatonalolargocopiloto5)));

%Factor de corrección de multiples medidas de mejora
FCAC17=MLG_anual17/Total17;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h17=1:length(Peatonalolargocopiloto5)
    t17(h17+1)=Peatonalolargocopiloto4(h17)*FCAC17;
end
Peatonalolargocopiloto6=t17(2:end);
Reduccion_total_MGL17=sum(Peatonalolargocopiloto6);
TF17x = isnan(Reduccion_total_MGL17);
Reduccion_total_MGL17(TF17x) = 0;

%Cruce peatonal (vía inpseccionada)
%Numero de carriles
if ncarrile==0
    ncarriles3=0;
elseif ncarrile==1
    ncarriles3=ncarriles(1,2);
elseif ncarrile==2
        ncarriles3=ncarriles(1,2);
elseif ncarrile==3
        ncarriles3=ncarriles(1,2);
elseif ncarrile==4
        ncarriles3=ncarriles(1,2);        
elseif ncarrile==5
        ncarriles3=ncarriles(1,2);        
else ncarrile==6
        ncarriles3=ncarriles(1,2);  
end
%Tipo de mediana
if tipomedian==0
 tipomediana5=0;
elseif tipomedian==1
 tipomediana5=tipomediana(1,3);
elseif tipomedian==2
 tipomediana5=tipomediana(1,3);
elseif tipomedian==3
 tipomediana5=tipomediana(1,3);
elseif tipomedian==4
 tipomediana5=tipomediana(1,3);
elseif tipomedian==5
 tipomediana5=tipomediana(1,3);
elseif tipomedian==6
 tipomediana5=tipomediana(1,3);
elseif tipomedian==7
 tipomediana5=tipomediana(1,3);
elseif tipomedian==8
 tipomediana5=tipomediana(1,3);
elseif tipomedian==9
 tipomediana5=tipomediana(1,3);
elseif tipomedian==10
 tipomediana5=tipomediana(1,3);
elseif tipomedian==11
 tipomediana5=tipomediana(1,3);
elseif tipomedian==12
 tipomediana5=tipomediana(1,3);
elseif tipomedian==13
 tipomediana5=tipomediana(1,3);
elseif tipomedian==14
 tipomediana5=tipomediana(1,3);
else tipomedian==15
 tipomediana5=tipomediana(1,3);
end
%Calidad del cruce peatonal
calicruc=x(40);
if calicruc==0
    calicruce=0;
elseif calicruc==1
    calicruce=1;
elseif calicruc==2
    calicruce=1.5;    
else calicruc==3
    calicruce=1;
end

%%Interseccion
if tipointe==0
    tipointer7=0;
elseif tipointe==1
    tipointer7=tipointer(1,3);
elseif tipointe==2
    tipointer7=tipointer(1,3);
elseif tipointe==3
    tipointer7=tipointer(1,3);
elseif tipointe==4
    tipointer7=tipointer(1,3);
elseif tipointe==5
    tipointer7=tipointer(1,3);
elseif tipointe==6
    tipointer7=tipointer(1,3);
elseif tipointe==7
    tipointer7=tipointer(1,3);
elseif tipointe==8
    tipointer7=tipointer(1,3);
elseif tipointe==9
    tipointer7=tipointer(1,3);
elseif tipointe==10
    tipointer7=tipointer(1,3);
elseif tipointe==11
    tipointer7=tipointer(1,3);
elseif tipointe==12
    tipointer7=tipointer(1,3);
elseif tipointe==13
    tipointer7=tipointer(1,3);
elseif tipointe==14
    tipointer7=tipointer(1,3);
elseif tipointe==15
    tipointer7=tipointer(1,3);
else tipointe==16
    tipointer7=tipointer(1,3);
end

%Vallas peatonales
valla=x(42);
if valla==0
    vallap=0
elseif valla==1
    vallap=1
else valla==2
    vallap=1.25
end
%Alumbrado publico
if alumbrad==0
    alumbrado3=0;
elseif alumbrad==1
    alumbrado3=alumbrado(1,2);
else alumbrad==2
   alumbrado3=alumbrado(1,2);
end
%Cruce peatonal -- vía inspeccionada
supescolar=x(48)
T40=[0.4 0.3 0.4;1 0.95 1;1.25 1.2 1.25;3.8 1 3.8;4.8 1.25 4.8;5.1 3.8 5.1;6.7 4.8 5.1;2.5 1 2.5;3.2 1 3.2;3.4 2.5 3.4;4.5 3.2 4.5];
infcrucepe=x(39)
if infcrucepe==0 && supescolar==3
    infcrucep=0;
elseif infcrucepe==1 && supescolar==3
    infcrucep=0.4;
elseif infcrucepe==2 && supescolar==3
    infcrucep=1;
elseif infcrucepe==3 && supescolar==3
    infcrucep=1.25;
elseif infcrucepe==4 && supescolar==3
    infcrucep=3.8;
elseif infcrucepe==5 && supescolar==3
    infcrucep=4.8;
elseif infcrucepe==6 && supescolar==3
    infcrucep=5.1;
elseif infcrucepe==7 && supescolar==3
    infcrucep=6.7;        
elseif infcrucepe==8 && supescolar==3
    infcrucep=2.5;    
elseif infcrucepe==9 && supescolar==3
    infcrucep=3.2;   
elseif infcrucepe==10 && supescolar==3
    infcrucep=3.4;    
elseif infcrucepe==11 && supescolar==3
    infcrucep=4.5;    
end
if infcrucepe==0 && supescolar==1
    infcrucep=0;
elseif infcrucepe==1 && supescolar==1
    infcrucep=0.3;
elseif infcrucepe==2 && supescolar==1
    infcrucep=0.95;
elseif infcrucepe==3 && supescolar==1
    infcrucep=1.2;
elseif infcrucepe==4 && supescolar==1
    infcrucep=1;
elseif infcrucepe==5 && supescolar==1
    infcrucep=1.25;
elseif infcrucepe==6 && supescolar==1
    infcrucep=3.8;
elseif infcrucepe==7 && supescolar==1
    infcrucep=4.8;        
elseif infcrucepe==8 && supescolar==1
    infcrucep=1;    
elseif infcrucepe==9 && supescolar==1
    infcrucep=1;   
elseif infcrucepe==10 && supescolar==1
    infcrucep=2.5;    
elseif infcrucepe==11 && supescolar==1
    infcrucep=3.2;    
end
if infcrucepe==0 && supescolar==2
    infcrucep=0;
elseif infcrucepe==1 && supescolar==2
    infcrucep=0.4;
elseif infcrucepe==2 && supescolar==2
    infcrucep=1;
elseif infcrucepe==3 && supescolar==2
    infcrucep=1.25;
elseif infcrucepe==4 && supescolar==2
    infcrucep=3.8;
elseif infcrucepe==5 && supescolar==2
    infcrucep=4.8;
elseif infcrucepe==6 && supescolar==2
    infcrucep=5.1;
elseif infcrucepe==7 && supescolar==2
    infcrucep=6.7;        
elseif infcrucepe==8 && supescolar==2
    infcrucep=2.5;    
elseif infcrucepe==9 && supescolar==2
    infcrucep=3.2;   
elseif infcrucepe==10 && supescolar==2
    infcrucep=3.4;    
elseif infcrucepe==11 && supescolar==2
    infcrucep=4.5;    
end

%Cruce peatonal --- severidad
infcruceinsp1=90;

%Reducción prevista de los MLG (si la medida se instalara por si sola)
Peatoncruceinspeccionado=zeros(1,14);
Peatoncruceinspeccionado(1)=ncarriles3;
Peatoncruceinspeccionado(2)=tipomediana5;
Peatoncruceinspeccionado(3)=infcrucep;
Peatoncruceinspeccionado(4)=calicruce;
Peatoncruceinspeccionado(5)=tipointer7;
Peatoncruceinspeccionado(6)=calinter;
Peatoncruceinspeccionado(7)=vallap;
Peatoncruceinspeccionado(8)=resdeslizamiento2;
Peatoncruceinspeccionado(9)=alumbrado3;
Peatoncruceinspeccionado(10)=distvisual;
Peatoncruceinspeccionado(11)=estveh;
Peatoncruceinspeccionado(12)=gestvelo;
Peatoncruceinspeccionado(13)=infcruceinsp1;
Peatoncruceinspeccionado(14)=veloperacionpe

Peatoncruceinspeccionado2=y.Factores19

for i18=1:length(Peatoncruceinspeccionado)
    p18(i18+1)=((Peatoncruceinspeccionado(i18)-Peatoncruceinspeccionado2(i18))*100)/((Peatoncruceinspeccionado(i18)));
end
Peatoncruceinspeccionado3=p18(2:end);
TF18 = isnan(Peatoncruceinspeccionado3);
Peatoncruceinspeccionado3(TF18) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j18=1:length(Peatoncruceinspeccionado3)
    q18(j18+1)=MLG*(Peatoncruceinspeccionado3(j18)/100);
end
Peatoncruceinspeccionado4=q18(2:end);
Total18=sum(Peatoncruceinspeccionado4);

%Reducción MGL - Método multiplicativo
for k18=1:length(Peatoncruceinspeccionado4)
    s18(k18+1)=1-(Peatoncruceinspeccionado3(k18)/100);
end
Peatoncruceinspeccionado5=s18(2:end);
MLG_anual18=MLG*(1-(prod(Peatoncruceinspeccionado5)));

%Factor de corrección de multiples medidas de mejora
FCAC18=MLG_anual18/Total18;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h18=1:length(Peatoncruceinspeccionado5)
    t18(h18+1)=Peatoncruceinspeccionado4(h18)*FCAC18;
end
Peatoncruceinspeccionado6=t18(2:end);
Reduccion_total_MGL18=sum(Peatoncruceinspeccionado6);
TF18x = isnan(Reduccion_total_MGL18);
Reduccion_total_MGL18(TF18x) = 0;

%Cruce peatonal (vía lateral)
%Infraestructura para cruce peatonal - via lateral
infcrucepelat=x(41)
if infcrucepelat==0 && supescolar==3
    infcrucep1=0;
elseif infcrucepelat==1 && supescolar==3
    infcrucep1=0.4;
elseif infcrucepelat==2 && supescolar==3
    infcrucep1=1;
elseif infcrucepelat==3 && supescolar==3
    infcrucep1=1.25;
elseif infcrucepelat==4 && supescolar==3
    infcrucep1=3.8;
elseif infcrucepelat==5 && supescolar==3
    infcrucep1=4.8;
elseif infcrucepelat==6 && supescolar==3
    infcrucep1=5.1;
elseif infcrucepelat==7 && supescolar==3
    infcrucep1=6.7;        
elseif infcrucepelat==8 && supescolar==3
    infcrucep1=2.5;    
elseif infcrucepelat==9 && supescolar==3
    infcrucep1=3.2;   
elseif infcrucepelat==10 && supescolar==3
    infcrucep1=3.4;    
elseif infcrucepelat==11 && supescolar==3
    infcrucep1=4.5;    
end
if infcrucepelat==0 && supescolar==1
    infcrucep1=0;
elseif infcrucepelat==1 && supescolar==1
    infcrucep1=0.3;
elseif infcrucepelat==2 && supescolar==1
    infcrucep1=0.95;
elseif infcrucepelat==3 && supescolar==1
    infcrucep1=1.2;
elseif infcrucepelat==4 && supescolar==1
    infcrucep1=1;
elseif infcrucepelat==5 && supescolar==1
    infcrucep1=1.25;
elseif infcrucepelat==6 && supescolar==1
    infcrucep1=3.8;
elseif infcrucepelat==7 && supescolar==1
    infcrucep1=4.8;        
elseif infcrucepelat==8 && supescolar==1
    infcrucep1=1;    
elseif infcrucepelat==9 && supescolar==1
    infcrucep1=1;   
elseif infcrucepelat==10 && supescolar==1
    infcrucep1=2.5;    
elseif infcrucepelat==11 && supescolar==1
    infcrucep1=3.2;    
end
if infcrucepelat==0 && supescolar==2
    infcrucep1=0;
elseif infcrucepelat==1 && supescolar==2
    infcrucep1=0.4;
elseif infcrucepelat==2 && supescolar==2
    infcrucep1=1;
elseif infcrucepelat==3 && supescolar==2
    infcrucep1=1.25;
elseif infcrucepelat==4 && supescolar==2
    infcrucep1=3.8;
elseif infcrucepelat==5 && supescolar==2
    infcrucep1=4.8;
elseif infcrucepelat==6 && supescolar==2
    infcrucep1=5.1;
elseif infcrucepelat==7 && supescolar==2
    infcrucep1=6.7;        
elseif infcrucepelat==8 && supescolar==2
    infcrucep1=2.5;    
elseif infcrucepelat==9 && supescolar==2
    infcrucep1=3.2;   
elseif infcrucepelat==10 && supescolar==2
    infcrucep1=3.4;    
elseif infcrucepelat==11 && supescolar==2
    infcrucep1=4.5;    
end

%Cruce peatonal en la vái lateral --- severidad
infcruceinsp1at=90;

%Reducción prevista de los MLG (si la medida se instalara por si sola)
Peatoncrucelateral=zeros(1,14);
Peatoncrucelateral(1)=ncarriles3;
Peatoncrucelateral(2)=tipomediana5;
Peatoncrucelateral(3)=infcrucep1;
Peatoncrucelateral(4)=calicruce;
Peatoncrucelateral(5)=tipointer7;
Peatoncrucelateral(6)=calinter;
Peatoncrucelateral(7)=vallap;
Peatoncrucelateral(8)=resdeslizamiento2;
Peatoncrucelateral(9)=alumbrado3;
Peatoncrucelateral(10)=distvisual;
Peatoncrucelateral(11)=estveh;
Peatoncrucelateral(12)=gestvelo;
Peatoncrucelateral(13)=infcruceinsp1at;
Peatoncrucelateral(14)=veloperacionpe

Peatoncrucelateral2=y.Factores20
if x(25)==11
    Reduccion_total_MGL19=0;
else
for i19=1:length(Peatoncrucelateral)
    p19(i19+1)=((Peatoncrucelateral(i19)-Peatoncrucelateral2(i19))*100)/((Peatoncrucelateral(i19)));
end
Peatoncrucelateral3=p19(2:end);
TF19 = isnan(Peatoncrucelateral3);
Peatoncrucelateral3(TF19) = 0;

%Reducción MGL (contramedida aplicada sola) - Método aditivo
for j19=1:length(Peatoncrucelateral3)
    q19(j19+1)=MLG*(Peatoncrucelateral3(j19)/100);
end
Peatoncrucelateral4=q19(2:end);
Total19=sum(Peatoncrucelateral4);

%Reducción MGL - Método multiplicativo
for k19=1:length(Peatoncrucelateral4)
    s19(k19+1)=1-(Peatoncrucelateral3(k19)/100);
end
Peatoncrucelateral5=s19(2:end);
MLG_anual19=MLG*(1-(prod(Peatoncrucelateral5)));

%Factor de corrección de multiples medidas de mejora
FCAC19=MLG_anual19/Total19;

%Reducción MGL - usando el fator de corrección de multiples medidas de mejora
for h19=1:length(Peatoncrucelateral5)
    t19(h19+1)=Peatoncrucelateral4(h19)*FCAC19;
end
Peatoncrucelateral6=t19(2:end);
Reduccion_total_MGL19=sum(Peatoncrucelateral6);
TF19x = isnan(Reduccion_total_MGL19);
Reduccion_total_MGL19(TF19x) = 0;
end
end
