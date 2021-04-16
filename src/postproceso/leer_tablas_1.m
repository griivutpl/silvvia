function [h1,i1,h2,i2,h3,i3,h4,i4,h5,i5,h6,i6,h7,i7,h8,i8,h9,i9,h10,i10,h11,i11,h12,i12,h13,i13,h14,i14,h15,i15,h16,i16,h17,i17,h18,i18,h19,i19,h20,i20,h21,i21,h22,i22,h23,i23,h24,i24,h25,i25,h26,i26,h27,i27,h28,i28,h29,i29,h30,i30,h31,i31,h32,i32,h33,i33,h34,i34,h35,i35,h36,i36,h37,i37,h38,i38,h39,i39,h40,i40,h41,i41,h42,i42,h43,i43,h44,i44,h45,i45,h46,i46,h47,i47,h48,i48,h49,i49,h50,i50,h51,i51,h52,i52,h53,i53,h54,i54,h55,i55,h56,i56,h57,i57,h58,i58,h59,i59,h60,i60,h61,i61,h62,i62,h63,i63,h64,i64,h65,i65,h66,i66] = leer_tablas_1(x) 
%Primer subatributo
f1=find(strcmpi(x.Tipo_de_carretera,'Calzada A de una calzada dividida'));
f2=find(strcmpi(x.Tipo_de_carretera,'Calzada B de una calzada dividida'));
f3=find(strcmpi(x.Tipo_de_carretera,'Carretera no dividida'));
f4=find(strcmpi(x.Tipo_de_carretera,'Calzada A de una infraestructura de motocicletas'));
f5=find(strcmpi(x.Tipo_de_carretera,'Calzada B de una infraestructura de motocicletas'));
g1=x.Distancia(f1);
g2=x.Distancia(f2);
g3=x.Distancia(f3);
g4=x.Distancia(f4);
g5=x.Distancia(f5);

h1=1/1000*sum(g1);
h2=1/1000*sum(g2);
h3=1/1000*sum(g3);
h4=1/1000*sum(g4);
h5=1/1000*sum(g5);

i1=(h1*100)/(1/1000*sum(x.Distancia));
i2=(h2*100)/(1/1000*sum(x.Distancia));
i3=(h3*100)/(1/1000*sum(x.Distancia));
i4=(h4*100)/(1/1000*sum(x.Distancia));
i5=(h5*100)/(1/1000*sum(x.Distancia));

%Segundo subatributo
f6=find(strcmpi(x.Costo_de_modernizacion,'Bajo'));
f7=find(strcmpi(x.Costo_de_modernizacion,'Medio'));
f8=find(strcmpi(x.Costo_de_modernizacion,'Alto'));

g6=x.Distancia(f6);
g7=x.Distancia(f7);
g8=x.Distancia(f8);

h6=1/1000*sum(g6);
h7=1/1000*sum(g7);
h8=1/1000*sum(g8);

i6=(h6*100)/(1/1000*sum(x.Distancia));
i7=(h7*100)/(1/1000*sum(x.Distancia));
i8=(h8*100)/(1/1000*sum(x.Distancia));

%Tercer subatributo
f9=find(strcmpi(x.Tipo_de_mediana,'Barrera de seguridad – metal'));
f10=find(strcmpi(x.Tipo_de_mediana,'Barrera de seguridad – concreto'));
f11=find(strcmpi(x.Tipo_de_mediana,'Mediana física con un ancho ≥ 20 m'));
f12=find(strcmpi(x.Tipo_de_mediana,'Mediana física con un ancho ≥ 10 m a < 20 m'));
f13=find(strcmpi(x.Tipo_de_mediana,'Mediana física con un ancho ≥ 5 m a < 10 m'));
f14=find(strcmpi(x.Tipo_de_mediana,'Mediana física con un ancho ≥ 1 m a < 5 m'));
f15=find(strcmpi(x.Tipo_de_mediana,'Mediana física con un ancho ≥ 0 m a < 1 m'));
f16=find(strcmpi(x.Tipo_de_mediana,'Carril central continuo para giro'));
f17=find(strcmpi(x.Tipo_de_mediana,'Delineadores flexibles'));
f18=find(strcmpi(x.Tipo_de_mediana,'Raya separadora de sentidos de circulación doble > 1 m y rayas diagonales a 45°'));
f19=find(strcmpi(x.Tipo_de_mediana,'Línea central'));
f20=find(strcmpi(x.Tipo_de_mediana,'Barrera de seguridad - amigable para motociclistas'));
f21=find(strcmpi(x.Tipo_de_mediana,'Un solo sentido'));
f22=find(strcmpi(x.Tipo_de_mediana,'Raya separadora de sentidos de circulación doble (0,3 m a 1 m) y rayas diagonales a 45°'));
f23=find(strcmpi(x.Tipo_de_mediana,'Barrera de seguridad - cable de acero'));

g9=x.Distancia(f9);
g10=x.Distancia(f10);
g11=x.Distancia(f11);
g12=x.Distancia(f12);
g13=x.Distancia(f13);
g14=x.Distancia(f14);
g15=x.Distancia(f15);
g16=x.Distancia(f16);
g17=x.Distancia(f17);
g18=x.Distancia(f18);
g19=x.Distancia(f19);
g20=x.Distancia(f20);
g21=x.Distancia(f21);
g22=x.Distancia(f22);
g23=x.Distancia(f23);

h9=1/1000*sum(g9);
h10=1/1000*sum(g10);
h11=1/1000*sum(g11);
h12=1/1000*sum(g12);
h13=1/1000*sum(g13);
h14=1/1000*sum(g14);
h15=1/1000*sum(g15);
h16=1/1000*sum(g16);
h17=1/1000*sum(g17);
h18=1/1000*sum(g18);
h19=1/1000*sum(g19);
h20=1/1000*sum(g20);
h21=1/1000*sum(g21);
h22=1/1000*sum(g22);
h23=1/1000*sum(g23);

i9=(h9*100)/(1/1000*sum(x.Distancia));
i10=(h10*100)/(1/1000*sum(x.Distancia));
i11=(h11*100)/(1/1000*sum(x.Distancia));
i12=(h12*100)/(1/1000*sum(x.Distancia));
i13=(h13*100)/(1/1000*sum(x.Distancia));
i14=(h14*100)/(1/1000*sum(x.Distancia));
i15=(h15*100)/(1/1000*sum(x.Distancia));
i16=(h16*100)/(1/1000*sum(x.Distancia));
i17=(h17*100)/(1/1000*sum(x.Distancia));
i18=(h18*100)/(1/1000*sum(x.Distancia));
i19=(h19*100)/(1/1000*sum(x.Distancia));
i20=(h20*100)/(1/1000*sum(x.Distancia));
i21=(h21*100)/(1/1000*sum(x.Distancia));
i22=(h22*100)/(1/1000*sum(x.Distancia));
i23=(h23*100)/(1/1000*sum(x.Distancia));

%Cuarto subatributo
f24=find(strcmpi(x.Bandas_sonoras_centrales,'Ausente'));
f25=find(strcmpi(x.Bandas_sonoras_centrales,'Presente'));

g24=x.Distancia(f24);
g25=x.Distancia(f25);

h24=1/1000*sum(g24);
h25=1/1000*sum(g25);

i24=(h24*100)/(1/1000*sum(x.Distancia));
i25=(h25*100)/(1/1000*sum(x.Distancia));

%Quinto subatributo
f26=find(strcmpi(x.Numero_de_carriles,'Uno'));
f27=find(strcmpi(x.Numero_de_carriles,'Dos'));
f28=find(strcmpi(x.Numero_de_carriles,'Tres'));
f29=find(strcmpi(x.Numero_de_carriles,'Cuatro o más'));
f30=find(strcmpi(x.Numero_de_carriles,'Dos + uno'));
f31=find(strcmpi(x.Numero_de_carriles,'Tres + dos'));

g26=x.Distancia(f26);
g27=x.Distancia(f27);
g28=x.Distancia(f28);
g29=x.Distancia(f29);
g30=x.Distancia(f30);
g31=x.Distancia(f31);

h26=1/1000*sum(g26);
h27=1/1000*sum(g27);
h28=1/1000*sum(g28);
h29=1/1000*sum(g29);
h30=1/1000*sum(g30);
h31=1/1000*sum(g31);

i26=(h26*100)/(1/1000*sum(x.Distancia));
i27=(h27*100)/(1/1000*sum(x.Distancia));
i28=(h28*100)/(1/1000*sum(x.Distancia));
i29=(h29*100)/(1/1000*sum(x.Distancia));
i30=(h30*100)/(1/1000*sum(x.Distancia));
i31=(h31*100)/(1/1000*sum(x.Distancia));

%Sexto subatributo
f32=find(strcmpi(x.Ancho_de_carril,'Ancho (≥ 2,4 m)'));
f33=find(strcmpi(x.Ancho_de_carril,'Medio (≥ 1,0 m a 2,4 m)'));
f34=find(strcmpi(x.Ancho_de_carril,'Estrecho (≥ 0 m a 1,0 m)'));

g32=x.Distancia(f32);
g33=x.Distancia(f33);
g34=x.Distancia(f34);

h32=1/1000*sum(g32);
h33=1/1000*sum(g33);
h34=1/1000*sum(g34);

i32=(h32*100)/(1/1000*sum(x.Distancia));
i33=(h33*100)/(1/1000*sum(x.Distancia));
i34=(h34*100)/(1/1000*sum(x.Distancia));

%Séptimo subatributo
f35=find(strcmpi(x.Curvatura,'Recto o ligeramente curvado'));
f36=find(strcmpi(x.Curvatura,'Moderada'));
f37=find(strcmpi(x.Curvatura,'Cerrada'));
f38=find(strcmpi(x.Curvatura,'Muy cerrada'));

g35=x.Distancia(f35);
g36=x.Distancia(f36);
g37=x.Distancia(f37);
g38=x.Distancia(f38);

h35=1/1000*sum(g35);
h36=1/1000*sum(g36);
h37=1/1000*sum(g37);
h38=1/1000*sum(g38);

i35=(h35*100)/(1/1000*sum(x.Distancia));
i36=(h36*100)/(1/1000*sum(x.Distancia));
i37=(h37*100)/(1/1000*sum(x.Distancia));
i38=(h38*100)/(1/1000*sum(x.Distancia));

%Octavo subatributo
f39=find(strcmpi(x.Calidad_de_la_curva,'Adecuada'));
f40=find(strcmpi(x.Calidad_de_la_curva,'Deficiente'));
f41=find(strcmpi(x.Calidad_de_la_curva,'No aplica'));

g39=x.Distancia(f39);
g40=x.Distancia(f40);
g41=x.Distancia(f41);

h39=1/1000*sum(g39);
h40=1/1000*sum(g40);
h41=1/1000*sum(g41);

i39=(h39*100)/(1/1000*sum(x.Distancia));
i40=(h40*100)/(1/1000*sum(x.Distancia));
i41=(h41*100)/(1/1000*sum(x.Distancia));

%Noveno subatributo
f42=find(strcmpi(x.Pendiente,'0 % a < 7,5 %'));
f43=find(strcmpi(x.Pendiente,'7,5 % a 10 %'));
f44=find(strcmpi(x.Pendiente,'≥ 10 %'));

g42=x.Distancia(f42);
g43=x.Distancia(f43);
g44=x.Distancia(f44);

h42=1/1000*sum(g42);
h43=1/1000*sum(g43);
h44=1/1000*sum(g44);

i42=(h42*100)/(1/1000*sum(x.Distancia));
i43=(h43*100)/(1/1000*sum(x.Distancia));
i44=(h44*100)/(1/1000*sum(x.Distancia));

%Décimo subatributo
f45=find(strcmpi(x.Estado_de_la_superficie_de_la_via,'Buena'));
f46=find(strcmpi(x.Estado_de_la_superficie_de_la_via,'Regular'));
f47=find(strcmpi(x.Estado_de_la_superficie_de_la_via,'Mala'));

g45=x.Distancia(f45);
g46=x.Distancia(f46);
g47=x.Distancia(f47);

h45=1/1000*sum(g45);
h46=1/1000*sum(g46);
h47=1/1000*sum(g47);

i45=(h45*100)/(1/1000*sum(x.Distancia));
i46=(h46*100)/(1/1000*sum(x.Distancia));
i47=(h47*100)/(1/1000*sum(x.Distancia));

%Décimo primero subatributo
f48=find(strcmpi(x.Resistencia_al_deslizamiento,'Pavimentado – adecuado'));
f49=find(strcmpi(x.Resistencia_al_deslizamiento,'Pavimentado – regular'));
f50=find(strcmpi(x.Resistencia_al_deslizamiento,'Pavimentado – pobre'));
f51=find(strcmpi(x.Resistencia_al_deslizamiento,'Sin pavimentar – adecuado'));
f52=find(strcmpi(x.Resistencia_al_deslizamiento,'Sin pavimentar – pobre'));

g48=x.Distancia(f48);
g49=x.Distancia(f49);
g50=x.Distancia(f50);
g51=x.Distancia(f51);
g52=x.Distancia(f52);

h48=1/1000*sum(g48);
h49=1/1000*sum(g49);
h50=1/1000*sum(g50);
h51=1/1000*sum(g51);
h52=1/1000*sum(g52);

i48=(h48*100)/(1/1000*sum(x.Distancia));
i49=(h49*100)/(1/1000*sum(x.Distancia));
i50=(h50*100)/(1/1000*sum(x.Distancia));
i51=(h51*100)/(1/1000*sum(x.Distancia));
i52=(h52*100)/(1/1000*sum(x.Distancia));

%Décimo segundo subatributo
f53=find(strcmpi(x.Delineacion,'Adecuada'));
f54=find(strcmpi(x.Delineacion,'Deficiente'));

g53=x.Distancia(f53);
g54=x.Distancia(f54);

h53=1/1000*sum(g53);
h54=1/1000*sum(g54);

i53=(h53*100)/(1/1000*sum(x.Distancia));
i54=(h54*100)/(1/1000*sum(x.Distancia));

%Décimo tercero subatributo
f55=find(strcmpi(x.Alumbrado_publico,'Ausente'));
f56=find(strcmpi(x.Alumbrado_publico,'Presente'));

g55=x.Distancia(f55);
g56=x.Distancia(f56);

h55=1/1000*sum(g55);
h56=1/1000*sum(g56);

i55=(h55*100)/(1/1000*sum(x.Distancia));
i56=(h56*100)/(1/1000*sum(x.Distancia));

%Décimo cuarto subatributo
f57=find(strcmpi(x.Estacionamiento_para_vehiculos,'Ninguno'));
f58=find(strcmpi(x.Estacionamiento_para_vehiculos,'Un lado'));
f59=find(strcmpi(x.Estacionamiento_para_vehiculos,'Dos lados'));

g57=x.Distancia(f57);
g58=x.Distancia(f58);
g59=x.Distancia(f59);

h57=1/1000*sum(g57);
h58=1/1000*sum(g58);
h59=1/1000*sum(g59);

i57=(h57*100)/(1/1000*sum(x.Distancia));
i58=(h58*100)/(1/1000*sum(x.Distancia));
i59=(h59*100)/(1/1000*sum(x.Distancia));

%Décimo quinto subatributo
f60=find(strcmpi(x.Via_de_servicio,'Ausente'));
f61=find(strcmpi(x.Via_de_servicio,'Presente'));

g60=x.Distancia(f60);
g61=x.Distancia(f61);

h60=1/1000*sum(g60);
h61=1/1000*sum(g61);

i60=(h60*100)/(1/1000*sum(x.Distancia));
i61=(h61*100)/(1/1000*sum(x.Distancia));

%Décimo sexto subatributo
f62=find(strcmpi(x.Obras_en_la_carretera,'Sin obras'));
f63=find(strcmpi(x.Obras_en_la_carretera,'Obra menor en proceso'));
f64=find(strcmpi(x.Obras_en_la_carretera,'Obra mayor en proceso'));

g62=x.Distancia(f62);
g63=x.Distancia(f63);
g64=x.Distancia(f64);

h62=1/1000*sum(g62);
h63=1/1000*sum(g63);
h64=1/1000*sum(g64);

i62=(h62*100)/(1/1000*sum(x.Distancia));
i63=(h63*100)/(1/1000*sum(x.Distancia));
i64=(h64*100)/(1/1000*sum(x.Distancia));

%Décimo séptimo subatributo
f65=find(strcmpi(x.Distancia_de_visibilidad,'Adecuada'));
f66=find(strcmpi(x.Distancia_de_visibilidad,'Deficiente'));

g65=x.Distancia(f65);
g66=x.Distancia(f66);

h65=1/1000*sum(g65);
h66=1/1000*sum(g66);

i65=(h65*100)/(1/1000*sum(x.Distancia));
i66=(h66*100)/(1/1000*sum(x.Distancia));
end