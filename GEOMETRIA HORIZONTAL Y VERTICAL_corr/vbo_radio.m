global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end

%%
pi_1 = info_struct.Position
%longitud
p1=pi_1(1,1)
%latitud
p2=pi_1(1,2)

%% Posicion
latitud = vbo.channels(3).data;
longitud = vbo.channels(4).data;
%punto medio
pm1 = find(longitud==p1)
pi1=(pm1-42)
pf1=(pm1+47)
%% 
distancia = vbo.channels(14).data;

heading = vbo.channels(6).data;
% % Valores de matricez de calculos
% Distancias
d1 = distancia(pi1,1);
d2 = distancia(pm1,1);
d3 = distancia(pf1,1);
% Heading
h1 = heading(pi1,1);
h2 = heading(pm1,1);
h3 = heading(pf1,1);
%Distancia Parciales
dp1 = 0;
dp2 = d2-d1;
dp3 = d3-d2;
%Headin en radianes
hr1 = h1*pi/180;
hr2 = h2*pi/180;
hr3 = h3*pi/180;
%Cuadradros de heading
hc1 = hr1^2*-1;
hc2 = hr2^2*-1;
hc3 = hr3^2*-1;
%Cuadradros de distancia 
dc1 = dp1^2*-1;
dc2 = dp2^2*-1;
dc3 = dp3^2*-1;

%Minimos Cuadrados
M1 =[dp1 hr1 1 ; dp2 hr2 1 ; dp3 hr3 1 ];
M2 = [ hc1+dc1; hc2+dc2; hc3+dc3];

Mi = inv(M1);

MT = Mi*M2;

MT1 = MT([1 2],1)/2;
MT2 = MT(3,1)*-1;
%Radio
SM = abs(MT1(1,1) + MT1(2,1) +MT2);
R1 = sqrt(SM)
%%
%Radio 2
%punto medio
pi1_2=(pm1-35)
pf1_2=(pm1+37)
%% 
distancia = vbo.channels(14).data;

heading = vbo.channels(6).data;
% % Valores de matricez de calculos
% Distancias
d1 = distancia(pi1_2,1);
d2 = distancia(pm1,1);
d3 = distancia(pf1_2,1);
% Heading
h1 = heading(pi1_2,1);
h2 = heading(pm1,1);
h3 = heading(pf1_2,1);
%Distancia Parciales
dp1 = 0;
dp2 = d2-d1;
dp3 = d3-d2;
%Headin en radianes
hr1 = h1*pi/180;
hr2 = h2*pi/180;
hr3 = h3*pi/180;
%Cuadradros de heading
hc1 = hr1^2*-1;
hc2 = hr2^2*-1;
hc3 = hr3^2*-1;
%Cuadradros de distancia 
dc1 = dp1^2*-1;
dc2 = dp2^2*-1;
dc3 = dp3^2*-1;

%Minimos Cuadrados
M1 =[dp1 hr1 1 ; dp2 hr2 1 ; dp3 hr3 1 ];
M2 = [ hc1+dc1; hc2+dc2; hc3+dc3];

Mi = inv(M1);

MT = Mi*M2;

MT1 = MT([1 2],1)/2;
MT2 = MT(3,1)*-1;
%Radio
SM = abs(MT1(1,1) + MT1(2,1) +MT2);
R2 = sqrt(SM)
%%
%Radio 3
%punto medio
pi1_3=(pm1-30)
pf1_3=(pm1+32)
%% 
distancia = vbo.channels(14).data;

heading = vbo.channels(6).data;
% % Valores de matricez de calculos
% Distancias
d1 = distancia(pi1_3,1);
d2 = distancia(pm1,1);
d3 = distancia(pf1_3,1);
% Heading
h1 = heading(pi1_3,1);
h2 = heading(pm1,1);
h3 = heading(pf1_3,1);
%Distancia Parciales
dp1 = 0;
dp2 = d2-d1;
dp3 = d3-d2;
%Headin en radianes
hr1 = h1*pi/180;
hr2 = h2*pi/180;
hr3 = h3*pi/180;
%Cuadradros de heading
hc1 = hr1^2*-1;
hc2 = hr2^2*-1;
hc3 = hr3^2*-1;
%Cuadradros de distancia 
dc1 = dp1^2*-1;
dc2 = dp2^2*-1;
dc3 = dp3^2*-1;

%Minimos Cuadrados
M1 =[dp1 hr1 1 ; dp2 hr2 1 ; dp3 hr3 1 ];
M2 = [ hc1+dc1; hc2+dc2; hc3+dc3];

Mi = inv(M1);

MT = Mi*M2;

MT1 = MT([1 2],1)/2;
MT2 = MT(3,1)*-1;
%Radio
SM = abs(MT1(1,1) + MT1(2,1) +MT2);
R3 = sqrt(SM)
%%
%Radio final
RF=(R1+R2+R3)/3

   
