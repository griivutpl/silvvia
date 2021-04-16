function [h1,i1,h2,i2,h3,i3,h4,i4,h5,i5,h6,i6,h7,i7,h8,i8,h9,i9,h10,i10,h12,i12,h13,i13,h14,i14,h15,i15,h16,i16,h17,i17,h18,i18,h19,i19,h20,i20,h21,i21,h22,i22,h23,i23,h24,i24,h25,i25,h26,i26,h27,i27,h28,i28,h29,i29,h30,i30,h31,i31,h32,i32,h33,i33] = leer_tablas_2(x) 
%Primer subatributo
f1=find(strcmpi(x.Tipo_de_interseccion,'Carril de incorporación'));
f2=find(strcmpi(x.Tipo_de_interseccion,'Redondel'));
f3=find(strcmpi(x.Tipo_de_interseccion,'3 ramas (no semaforizada) con carril de giro protegido'));
f4=find(strcmpi(x.Tipo_de_interseccion,'3 ramas (no semaforizada) con carril de giro no protegido'));
f5=find(strcmpi(x.Tipo_de_interseccion,'3 ramas (semaforizada) con carril de giro protegido'));
f6=find(strcmpi(x.Tipo_de_interseccion,'3 ramas (semaforizada) con carril de giro no protegido'));
f7=find(strcmpi(x.Tipo_de_interseccion,'4 ramas (no semaforizada) con carril de giro protegido'));
f8=find(strcmpi(x.Tipo_de_interseccion,'4 ramas (no semaforizada) con carril de giro no protegido'));
f9=find(strcmpi(x.Tipo_de_interseccion,'4 ramas (semaforizada) con carril de giro protegido'));
f10=find(strcmpi(x.Tipo_de_interseccion,'4 ramas (semaforizada) con carril de giro no protegido'));
f12=find(strcmpi(x.Tipo_de_interseccion,'Ninguno'));
f13=find(strcmpi(x.Tipo_de_interseccion,'Cruce de ferrocarril - pasivo (solo señalización vertical)'));
f14=find(strcmpi(x.Tipo_de_interseccion,'Cruce de ferrocarril - activo (semáforo intermitente / pluma)'));
f15=find(strcmpi(x.Tipo_de_interseccion,'Punto de cruce de mediana - informal'));
f16=find(strcmpi(x.Tipo_de_interseccion,'Punto de cruce de mediana - formal'));
f17=find(strcmpi(x.Tipo_de_interseccion,'Mini redondel'));

g1=x.Distancia(f1);
g2=x.Distancia(f2);
g3=x.Distancia(f3);
g4=x.Distancia(f4);
g5=x.Distancia(f5);
g6=x.Distancia(f6);
g7=x.Distancia(f7);
g8=x.Distancia(f8);
g9=x.Distancia(f9);
g10=x.Distancia(f10);
g12=x.Distancia(f12);
g13=x.Distancia(f13);
g14=x.Distancia(f14);
g15=x.Distancia(f15);
g16=x.Distancia(f16);
g17=x.Distancia(f17);

h1=1/1000*sum(g1);
h2=1/1000*sum(g2);
h3=1/1000*sum(g3);
h4=1/1000*sum(g4);
h5=1/1000*sum(g5);
h6=1/1000*sum(g6);
h7=1/1000*sum(g7);
h8=1/1000*sum(g8);
h9=1/1000*sum(g9);
h10=1/1000*sum(g10);
h12=1/1000*sum(g12);
h13=1/1000*sum(g13);
h14=1/1000*sum(g14);
h15=1/1000*sum(g15);
h16=1/1000*sum(g16);
h17=1/1000*sum(g17);

i1=(h1*100)/(1/1000*sum(x.Distancia));
i2=(h2*100)/(1/1000*sum(x.Distancia));
i3=(h3*100)/(1/1000*sum(x.Distancia));
i4=(h4*100)/(1/1000*sum(x.Distancia));
i5=(h5*100)/(1/1000*sum(x.Distancia));
i6=(h6*100)/(1/1000*sum(x.Distancia));
i7=(h7*100)/(1/1000*sum(x.Distancia));
i8=(h8*100)/(1/1000*sum(x.Distancia));
i9=(h9*100)/(1/1000*sum(x.Distancia));
i10=(h10*100)/(1/1000*sum(x.Distancia));
i12=(h12*100)/(1/1000*sum(x.Distancia));
i13=(h13*100)/(1/1000*sum(x.Distancia));
i14=(h14*100)/(1/1000*sum(x.Distancia));
i15=(h15*100)/(1/1000*sum(x.Distancia));
i16=(h16*100)/(1/1000*sum(x.Distancia));
i17=(h17*100)/(1/1000*sum(x.Distancia));

%Segundo subatributo
f18=find(strcmpi(x.Canalizacion_de_la_interseccion,'Ausente'));
f19=find(strcmpi(x.Canalizacion_de_la_interseccion,'Presente'));

g18=x.Distancia(f18);
g19=x.Distancia(f19);

h18=1/1000*sum(g18);
h19=1/1000*sum(g19);

i18=(h18*100)/(1/1000*sum(x.Distancia));
i19=(h19*100)/(1/1000*sum(x.Distancia));

%Tercer subatributo
f20=find(strcmpi(x.Volumen_de_la_interseccion,'≥ 15,000 vehículos'));
f21=find(strcmpi(x.Volumen_de_la_interseccion,'10,000 a 15,000 vehículos'));
f22=find(strcmpi(x.Volumen_de_la_interseccion,'5,000 a 10,000 vehículos'));
f23=find(strcmpi(x.Volumen_de_la_interseccion,'1,000 a 5,000 vehículos'));
f24=find(strcmpi(x.Volumen_de_la_interseccion,'100 a 1,000 vehículos'));
f25=find(strcmpi(x.Volumen_de_la_interseccion,'1 a 100 vehículos'));
f26=find(strcmpi(x.Volumen_de_la_interseccion,'Ninguno'));


g20=x.Distancia(f20);
g21=x.Distancia(f21);
g22=x.Distancia(f22);
g23=x.Distancia(f23);
g24=x.Distancia(f24);
g25=x.Distancia(f25);
g26=x.Distancia(f26);

h20=1/1000*sum(g20);
h21=1/1000*sum(g21);
h22=1/1000*sum(g22);
h23=1/1000*sum(g23);
h24=1/1000*sum(g24);
h25=1/1000*sum(g25);
h26=1/1000*sum(g26);

i20=(h20*100)/(1/1000*sum(x.Distancia));
i21=(h21*100)/(1/1000*sum(x.Distancia));
i22=(h22*100)/(1/1000*sum(x.Distancia));
i23=(h23*100)/(1/1000*sum(x.Distancia));
i24=(h24*100)/(1/1000*sum(x.Distancia));
i25=(h25*100)/(1/1000*sum(x.Distancia));
i26=(h26*100)/(1/1000*sum(x.Distancia));

%Cuarto subatributo
f27=find(strcmpi(x.Calidad_de_la_interseccion,'Adecuada'));
f28=find(strcmpi(x.Calidad_de_la_interseccion,'Deficiente'));
f29=find(strcmpi(x.Calidad_de_la_interseccion,'No aplica'));

g27=x.Distancia(f27);
g28=x.Distancia(f28);
g29=x.Distancia(f29);

h27=1/1000*sum(g27);
h28=1/1000*sum(g28);
h29=1/1000*sum(g29);

i27=(h27*100)/(1/1000*sum(x.Distancia));
i28=(h28*100)/(1/1000*sum(x.Distancia));
i29=(h29*100)/(1/1000*sum(x.Distancia));

%Quinto subatributo
f30=find(strcmpi(x.Puntos_de_acceso_a_la_propiedad,'Acceso comercial 1+'));
f31=find(strcmpi(x.Puntos_de_acceso_a_la_propiedad,'Acceso residencial 3+'));
f32=find(strcmpi(x.Puntos_de_acceso_a_la_propiedad,'Acceso residencial 1 o 2'));
f33=find(strcmpi(x.Puntos_de_acceso_a_la_propiedad,'Ninguno'));

g30=x.Distancia(f30);
g31=x.Distancia(f31);
g32=x.Distancia(f32);
g33=x.Distancia(f33);

h30=1/1000*sum(g30);
h31=1/1000*sum(g31);
h32=1/1000*sum(g32);
h33=1/1000*sum(g33);

i30=(h30*100)/(1/1000*sum(x.Distancia));
i31=(h31*100)/(1/1000*sum(x.Distancia));
i32=(h32*100)/(1/1000*sum(x.Distancia));
i33=(h33*100)/(1/1000*sum(x.Distancia));
end