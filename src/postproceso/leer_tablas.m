function [d1,c1,d2,c2,d3,c3,d4,c4,d5,c5,d6,c6,d7,c7,d8,c8,d9,c9,d10,c10,d11,c11,d12,c12,d13,c13,d14,c14,d15,c15,d16,c16,d17,c17,d18,c18,d19,c19,d20,c20,d21,c21,d22,c22,d23,c23,d24,c24,d25,c25,d26,c26,d27,c27,d28,c28,d29,c29,d30,c30,d31,c31,d32,c32,d33,c33,d34,c34,d35,c35,d36,c36,d37,c37,d38,c38,d39,c39,d40,c40,d41,c41,d42,c42,d43,c43,d44,c44,d45,c45,d46,c46,d47,c47,d48,c48,d49,c49,d50,c50,d51,c51,d52,c52] = leer_tablas(x) 
%Primer subatributo
a1=find(strcmpi(x.Severidad_lateral_distancia_al_objeto_lado_del_conductor,'0 a < 1 m'));
a2=find(strcmpi(x.Severidad_lateral_distancia_al_objeto_lado_del_conductor,'1 a < 5 m'));
a3=find(strcmpi(x.Severidad_lateral_distancia_al_objeto_lado_del_conductor,'5 a < 10 m'));
a4=find(strcmpi(x.Severidad_lateral_distancia_al_objeto_lado_del_conductor,'≥ 10 m'));
b1=x.Distancia(a1);
b2=x.Distancia(a2);
b3=x.Distancia(a3);
b4=x.Distancia(a4);

c1=1/1000*sum(b1);
c2=1/1000*sum(b2);
c3=1/1000*sum(b3);
c4=1/1000*sum(b4);

d1=(c1*100)/(1/1000*sum(x.Distancia));
d2=(c2*100)/(1/1000*sum(x.Distancia));
d3=(c3*100)/(1/1000*sum(x.Distancia));
d4=(c4*100)/(1/1000*sum(x.Distancia));

%Segundo subatributo
a5=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Barrera de seguridad – metal'));
a6=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Barrera de seguridad – hormigón'));
a7=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Barrera de seguridad – amigable para motocicletas'));
a8=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Barrera de seguridad – cable de acero'));
a9=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Cara vertical agresiva en el talud en corte'));
a10=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Pendiente ascendente del talud en corte (15° a 75°)'));
a11=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Pendiente empinada del talud en corte (> 75°)'));
a12=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Cuneta profunda'));
a13=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Terraplén'));
a14=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Precipicio'));
a15=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Árbol (≥ 10 cm de diámetro)'));
a16=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Letrero / poste / barra rígidos (≥ 10 cm de diámetro)'));
a17=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Estructura / puente / edificio rígidos'));
a18=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Estructura /edificio colapsable'));
a19=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Extremo de barrera desprotegido'));
a20=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Grandes rocas (≥ 20 cm de altura)'));
a21=find(strcmpi(x.Severidad_lateral_objeto_lado_del_conductor,'Ninguno (u objeto > 20 m de la carretera)'));

b5=x.Distancia(a5);
b6=x.Distancia(a6);
b7=x.Distancia(a7);
b8=x.Distancia(a8);
b9=x.Distancia(a9);
b10=x.Distancia(a10);
b11=x.Distancia(a11);
b12=x.Distancia(a12);
b13=x.Distancia(a13);
b14=x.Distancia(a14);
b15=x.Distancia(a15);
b16=x.Distancia(a16);
b17=x.Distancia(a17);
b18=x.Distancia(a18);
b19=x.Distancia(a19);
b20=x.Distancia(a20);
b21=x.Distancia(a21);

c5=1/1000*sum(b5);
c6=1/1000*sum(b6);
c7=1/1000*sum(b7);
c8=1/1000*sum(b8);
c9=1/1000*sum(b9);
c10=1/1000*sum(b10);
c11=1/1000*sum(b11);
c12=1/1000*sum(b12);
c13=1/1000*sum(b13);
c14=1/1000*sum(b14);
c15=1/1000*sum(b15);
c16=1/1000*sum(b16);
c17=1/1000*sum(b17);
c18=1/1000*sum(b18);
c19=1/1000*sum(b19);
c20=1/1000*sum(b20);
c21=1/1000*sum(b21);

d5=(c5*100)/(1/1000*sum(x.Distancia));
d6=(c6*100)/(1/1000*sum(x.Distancia));
d7=(c7*100)/(1/1000*sum(x.Distancia));
d8=(c8*100)/(1/1000*sum(x.Distancia));
d9=(c9*100)/(1/1000*sum(x.Distancia));
d10=(c10*100)/(1/1000*sum(x.Distancia));
d11=(c11*100)/(1/1000*sum(x.Distancia));
d12=(c12*100)/(1/1000*sum(x.Distancia));
d13=(c13*100)/(1/1000*sum(x.Distancia));
d14=(c14*100)/(1/1000*sum(x.Distancia));
d15=(c15*100)/(1/1000*sum(x.Distancia));
d16=(c16*100)/(1/1000*sum(x.Distancia));
d17=(c17*100)/(1/1000*sum(x.Distancia));
d18=(c18*100)/(1/1000*sum(x.Distancia));
d19=(c19*100)/(1/1000*sum(x.Distancia));
d20=(c20*100)/(1/1000*sum(x.Distancia));
d21=(c21*100)/(1/1000*sum(x.Distancia));

%Tercer subatributo
a22=find(strcmpi(x.Severidad_lateral_distancia_al_objeto_lado_del_copiloto,'0 a < 1 m'));
a23=find(strcmpi(x.Severidad_lateral_distancia_al_objeto_lado_del_copiloto,'1 a < 5 m'));
a24=find(strcmpi(x.Severidad_lateral_distancia_al_objeto_lado_del_copiloto,'5 a < 10 m'));
a25=find(strcmpi(x.Severidad_lateral_distancia_al_objeto_lado_del_copiloto,'≥ 10 m'));
b22=x.Distancia(a22);
b23=x.Distancia(a23);
b24=x.Distancia(a24);
b25=x.Distancia(a25);

c22=1/1000*sum(b22);
c23=1/1000*sum(b23);
c24=1/1000*sum(b24);
c25=1/1000*sum(b25);

d22=(c22*100)/(1/1000*sum(x.Distancia));
d23=(c23*100)/(1/1000*sum(x.Distancia));
d24=(c24*100)/(1/1000*sum(x.Distancia));
d25=(c25*100)/(1/1000*sum(x.Distancia));

%Cuarto subatributo
a26=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Barrera de seguridad – metal'));
a27=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Barrera de seguridad – hormigón'));
a28=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Barrera de seguridad – amigable para motocicletas'));
a29=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Barrera de seguridad – cable de acero'));
a30=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Cara vertical agresiva en el talud en corte'));
a31=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Pendiente ascendente del talud en corte (15° a 75°)'));
a32=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Pendiente empinada del talud en corte (> 75°)'));
a33=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Cuneta profunda'));
a34=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Terraplén'));
a35=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Precipicio'));
a36=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Árbol (≥ 10 cm de diámetro)'));
a37=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Letrero / poste / barra rígidos (≥ 10 cm de diámetro)'));
a38=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Estructura / puente / edificio rígidos'));
a39=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Estructura /edificio colapsable'));
a40=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Extremo de barrera desprotegido'));
a41=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Grandes rocas (≥ 20 cm de altura)'));
a42=find(strcmpi(x.Severidad_lateral_objeto_lado_del_copiloto,'Ninguno (u objeto > 20 m de la carretera)'));

b26=x.Distancia(a26);
b27=x.Distancia(a27);
b28=x.Distancia(a28);
b29=x.Distancia(a29);
b30=x.Distancia(a30);
b31=x.Distancia(a31);
b32=x.Distancia(a32);
b33=x.Distancia(a33);
b34=x.Distancia(a34);
b35=x.Distancia(a35);
b36=x.Distancia(a36);
b37=x.Distancia(a37);
b38=x.Distancia(a38);
b39=x.Distancia(a39);
b40=x.Distancia(a40);
b41=x.Distancia(a41);
b42=x.Distancia(a42);

c26=1/1000*sum(b26);
c27=1/1000*sum(b27);
c28=1/1000*sum(b28);
c29=1/1000*sum(b29);
c30=1/1000*sum(b30);
c31=1/1000*sum(b31);
c32=1/1000*sum(b32);
c33=1/1000*sum(b33);
c34=1/1000*sum(b34);
c35=1/1000*sum(b35);
c36=1/1000*sum(b36);
c37=1/1000*sum(b37);
c38=1/1000*sum(b38);
c39=1/1000*sum(b39);
c40=1/1000*sum(b40);
c41=1/1000*sum(b41);
c42=1/1000*sum(b42);

d26=(c26*100)/(1/1000*sum(x.Distancia));
d27=(c27*100)/(1/1000*sum(x.Distancia));
d28=(c28*100)/(1/1000*sum(x.Distancia));
d29=(c29*100)/(1/1000*sum(x.Distancia));
d30=(c30*100)/(1/1000*sum(x.Distancia));
d31=(c31*100)/(1/1000*sum(x.Distancia));
d32=(c32*100)/(1/1000*sum(x.Distancia));
d33=(c33*100)/(1/1000*sum(x.Distancia));
d34=(c34*100)/(1/1000*sum(x.Distancia));
d35=(c35*100)/(1/1000*sum(x.Distancia));
d36=(c36*100)/(1/1000*sum(x.Distancia));
d37=(c37*100)/(1/1000*sum(x.Distancia));
d38=(c38*100)/(1/1000*sum(x.Distancia));
d39=(c39*100)/(1/1000*sum(x.Distancia));
d40=(c40*100)/(1/1000*sum(x.Distancia));
d41=(c41*100)/(1/1000*sum(x.Distancia));
d42=(c42*100)/(1/1000*sum(x.Distancia));

%Quinto subatributo
a43=find(strcmpi(x.Bandas_sonoras_en_el_espaldon,'Ausente'));
a44=find(strcmpi(x.Bandas_sonoras_en_el_espaldon,'Presente'));

b43=x.Distancia(a43);
b44=x.Distancia(a44);

c43=1/1000*sum(b43);
c44=1/1000*sum(b44);

d43=(c43*100)/(1/1000*sum(x.Distancia));
d44=(c44*100)/(1/1000*sum(x.Distancia));

%Sexto subatributo
a45=find(strcmpi(x.Ancho_de_espaldon_pavimentado_lado_del_conductor,'Ancho (≥ 2,4 m)'));
a46=find(strcmpi(x.Ancho_de_espaldon_pavimentado_lado_del_conductor,'Medio (≥ 1,0 m a 2,4 m)'));
a47=find(strcmpi(x.Ancho_de_espaldon_pavimentado_lado_del_conductor,'Estrecho (≥ 0 m a 1,0 m)'));
a48=find(strcmpi(x.Ancho_de_espaldon_pavimentado_lado_del_conductor,'Ninguno'));

b45=x.Distancia(a45);
b46=x.Distancia(a46);
b47=x.Distancia(a47);
b48=x.Distancia(a48);

c45=1/1000*sum(b45);
c46=1/1000*sum(b46);
c47=1/1000*sum(b47);
c48=1/1000*sum(b48);

d45=(c45*100)/(1/1000*sum(x.Distancia));
d46=(c46*100)/(1/1000*sum(x.Distancia));
d47=(c47*100)/(1/1000*sum(x.Distancia));
d48=(c48*100)/(1/1000*sum(x.Distancia));

%Séptimo subatributo
a49=find(strcmpi(x.Ancho_de_espaldon_pavimentado_lado_del_copiloto,'Ancho (≥ 2,4 m)'));
a50=find(strcmpi(x.Ancho_de_espaldon_pavimentado_lado_del_copiloto,'Medio (≥ 1,0 m a 2,4 m)'));
a51=find(strcmpi(x.Ancho_de_espaldon_pavimentado_lado_del_copiloto,'Estrecho (≥ 0 m a 1,0 m)'));
a52=find(strcmpi(x.Ancho_de_espaldon_pavimentado_lado_del_copiloto,'Ninguno'));

b49=x.Distancia(a49);
b50=x.Distancia(a50);
b51=x.Distancia(a51);
b52=x.Distancia(a52);

c49=1/1000*sum(b49);
c50=1/1000*sum(b50);
c51=1/1000*sum(b51);
c52=1/1000*sum(b52);

d49=(c49*100)/(1/1000*sum(x.Distancia));
d50=(c50*100)/(1/1000*sum(x.Distancia));
d51=(c51*100)/(1/1000*sum(x.Distancia));
d52=(c52*100)/(1/1000*sum(x.Distancia));
end