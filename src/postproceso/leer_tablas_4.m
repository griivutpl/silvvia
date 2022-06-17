function [h1,i1,h2,i2,h3,i3,h4,i4,h6,i6,h7,i7,h8,i8,h9,i9,h10,i10,h11,i11,h13,i13,h14,i14,h15,i15,h16,i16,h17,i17,h18,i18,h19,i19,h20,i20,h21,i21,h22,i22,h23,i23,h24,i24,h25,i25,h26,i26,h27,i27,h28,i28,h29,i29,h30,i30,h31,i31,h32,i32,h33,i33,h34,i34,h35,i35,h36,i36,h37,i37,h38,i38,h39,i39,h40,i40,h41,i41,h43,i43,h44,i44,h45,i45,h46,i46,h47,i47,h48,i48,h49,i49,h50,i50,h51,i51,h52,i52,h53,i53,h54,i54,h55,i55,h56,i56,h57,i57,h58,i58,h59,i59,h60,i60,h61,i61,h62,i62,h63,i63,h64,i64,h65,i65,h66,i66,h67,i67,h68,i68,h69,i69,h70,i70,h71,i71,h72,i72,h73,i73,h74,i74,h75,i75,h76,i76,h77,i77,h78,i78] = leer_tablas_4(x) 
%Primer subatributo
f1=find(strcmpi(x.Uso_de_suelo_lado_del_conductor,'Áreas no desarrolladas'));
f2=find(strcmpi(x.Uso_de_suelo_lado_del_conductor,'Agricultura y ganadería'));
f3=find(strcmpi(x.Uso_de_suelo_lado_del_conductor,'Residencial'));
f4=find(strcmpi(x.Uso_de_suelo_lado_del_conductor,'Comercial'));
f6=find(strcmpi(x.Uso_de_suelo_lado_del_conductor,'Educacional'));
f7=find(strcmpi(x.Uso_de_suelo_lado_del_conductor,'Industrial y manufactura'));

g1=x.Distancia(f1);
g2=x.Distancia(f2);
g3=x.Distancia(f3);
g4=x.Distancia(f4);
g6=x.Distancia(f6);
g7=x.Distancia(f7);

h1=1/1000*sum(g1);
h2=1/1000*sum(g2);
h3=1/1000*sum(g3);
h4=1/1000*sum(g4);
h6=1/1000*sum(g6);
h7=1/1000*sum(g7);

i1=(h1*100)/(1/1000*sum(x.Distancia));
i2=(h2*100)/(1/1000*sum(x.Distancia));
i3=(h3*100)/(1/1000*sum(x.Distancia));
i4=(h4*100)/(1/1000*sum(x.Distancia));
i6=(h6*100)/(1/1000*sum(x.Distancia));
i7=(h7*100)/(1/1000*sum(x.Distancia));

%Segundo subatributo
f8=find(strcmpi(x.Uso_de_suelo_lado_del_copiloto,'Áreas no desarrolladas'));
f9=find(strcmpi(x.Uso_de_suelo_lado_del_copiloto,'Agricultura y ganadería'));
f10=find(strcmpi(x.Uso_de_suelo_lado_del_copiloto,'Residencial'));
f11=find(strcmpi(x.Uso_de_suelo_lado_del_copiloto,'Comercial'));
f13=find(strcmpi(x.Uso_de_suelo_lado_del_copiloto,'Educacional'));
f14=find(strcmpi(x.Uso_de_suelo_lado_del_copiloto,'Industrial y manufactura'));

g8=x.Distancia(f8);
g9=x.Distancia(f9);
g10=x.Distancia(f10);
g11=x.Distancia(f11);
g13=x.Distancia(f13);
g14=x.Distancia(f14);

h8=1/1000*sum(g8);
h9=1/1000*sum(g9);
h10=1/1000*sum(g10);
h11=1/1000*sum(g11);
h13=1/1000*sum(g13);
h14=1/1000*sum(g14);

i8=(h8*100)/(1/1000*sum(x.Distancia));
i9=(h9*100)/(1/1000*sum(x.Distancia));
i10=(h10*100)/(1/1000*sum(x.Distancia));
i11=(h11*100)/(1/1000*sum(x.Distancia));
i13=(h13*100)/(1/1000*sum(x.Distancia));
i14=(h14*100)/(1/1000*sum(x.Distancia));

%Tercer subatributo
f15=find(strcmpi(x.Tipo_de_area,'Rural/área abierta'));
f16=find(strcmpi(x.Tipo_de_area,'Urbano/ población pequeña o pueblo'));

g15=x.Distancia(f15);
g16=x.Distancia(f16);

h15=1/1000*sum(g15);
h16=1/1000*sum(g16);

i15=(h15*100)/(1/1000*sum(x.Distancia));
i16=(h16*100)/(1/1000*sum(x.Distancia));

%Cuarto subatributo
f17=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Infraestructura a desnivel'));
f18=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Semaforizada con refugio'));
f19=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Semaforizada sin refugio'));
f20=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'No semaforizada, señalizada con pintura y con refugio'));
f21=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'No semaforizada, señalizada con pintura y sin refugio'));
f22=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Solo refugio'));
f23=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Sin infraestructura'));
f24=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Cruce demarcado elevado, sin semáforo, con refugio'));
f25=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Cruce demarcado elevado, sin semáforo, sin refugio'));
f26=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Cruce no demarcado elevado, con refugio'));
f27=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_el_tramo_analizado,'Cruce no demarcado elevado, sin refugio'));

g17=x.Distancia(f17);
g18=x.Distancia(f18);
g19=x.Distancia(f19);
g20=x.Distancia(f20);
g21=x.Distancia(f21);
g22=x.Distancia(f22);
g23=x.Distancia(f23);
g24=x.Distancia(f24);
g25=x.Distancia(f25);
g26=x.Distancia(f26);
g27=x.Distancia(f27);

h17=1/1000*sum(g17);
h18=1/1000*sum(g18);
h19=1/1000*sum(g19);
h20=1/1000*sum(g20);
h21=1/1000*sum(g21);
h22=1/1000*sum(g22);
h23=1/1000*sum(g23);
h24=1/1000*sum(g24);
h25=1/1000*sum(g25);
h26=1/1000*sum(g26);
h27=1/1000*sum(g27);

i17=(h17*100)/(1/1000*sum(x.Distancia));
i18=(h18*100)/(1/1000*sum(x.Distancia));
i19=(h19*100)/(1/1000*sum(x.Distancia));
i20=(h20*100)/(1/1000*sum(x.Distancia));
i21=(h21*100)/(1/1000*sum(x.Distancia));
i22=(h22*100)/(1/1000*sum(x.Distancia));
i23=(h23*100)/(1/1000*sum(x.Distancia));
i24=(h24*100)/(1/1000*sum(x.Distancia));
i25=(h25*100)/(1/1000*sum(x.Distancia));
i26=(h26*100)/(1/1000*sum(x.Distancia));
i27=(h27*100)/(1/1000*sum(x.Distancia));

%Quinto subatributo
f28=find(strcmpi(x.Calidad_de_cruce_peatonal,'Adecuado'));
f29=find(strcmpi(x.Calidad_de_cruce_peatonal,'Pobre'));
f30=find(strcmpi(x.Calidad_de_cruce_peatonal,'No aplica'));

g28=x.Distancia(f28);
g29=x.Distancia(f29);
g30=x.Distancia(f30);

h28=1/1000*sum(g28);
h29=1/1000*sum(g29);
h30=1/1000*sum(g30);

i28=(h28*100)/(1/1000*sum(x.Distancia));
i29=(h29*100)/(1/1000*sum(x.Distancia));
i30=(h30*100)/(1/1000*sum(x.Distancia));

%Sexto subatributo
f31=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Infraestructura a desnivel'));
f32=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Semaforizada con refugio'));
f33=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Semaforizada sin refugio'));
f34=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'No semaforizada, señalizada con pintura y con refugio'));
f35=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'No semaforizada, señalizada con pintura y sin refugio'));
f36=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Solo refugio'));
f37=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Sin infraestructura'));
f38=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Cruce demarcado elevado, sin semáforo, con refugio'));
f39=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Cruce demarcado elevado, sin semáforo, sin refugio'));
f40=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Cruce no demarcado elevado, con refugio'));
f41=find(strcmpi(x.Infraestructura_de_cruce_peatonal_en_la_interseccion,'Cruce no demarcado elevado, sin refugio'));

g31=x.Distancia(f31);
g32=x.Distancia(f32);
g33=x.Distancia(f33);
g34=x.Distancia(f34);
g35=x.Distancia(f35);
g36=x.Distancia(f36);
g37=x.Distancia(f37);
g38=x.Distancia(f38);
g39=x.Distancia(f39);
g40=x.Distancia(f40);
g41=x.Distancia(f41);

h31=1/1000*sum(g31);
h32=1/1000*sum(g32);
h33=1/1000*sum(g33);
h34=1/1000*sum(g34);
h35=1/1000*sum(g35);
h36=1/1000*sum(g36);
h37=1/1000*sum(g37);
h38=1/1000*sum(g38);
h39=1/1000*sum(g39);
h40=1/1000*sum(g40);
h41=1/1000*sum(g41);

i31=(h31*100)/(1/1000*sum(x.Distancia));
i32=(h32*100)/(1/1000*sum(x.Distancia));
i33=(h33*100)/(1/1000*sum(x.Distancia));
i34=(h34*100)/(1/1000*sum(x.Distancia));
i35=(h35*100)/(1/1000*sum(x.Distancia));
i36=(h36*100)/(1/1000*sum(x.Distancia));
i37=(h37*100)/(1/1000*sum(x.Distancia));
i38=(h38*100)/(1/1000*sum(x.Distancia));
i39=(h39*100)/(1/1000*sum(x.Distancia));
i40=(h40*100)/(1/1000*sum(x.Distancia));
i41=(h41*100)/(1/1000*sum(x.Distancia));

%Séptimo subatributo
f43=find(strcmpi(x.Vallas_peatonales,'Presente'));
f44=find(strcmpi(x.Vallas_peatonales,'Ausente'));

g43=x.Distancia(f43);
g44=x.Distancia(f44);

h43=1/1000*sum(g43);
h44=1/1000*sum(g44);

i43=(h43*100)/(1/1000*sum(x.Distancia));
i44=(h44*100)/(1/1000*sum(x.Distancia));

%Octavo subatributo
f45=find(strcmpi(x.Acera_lado_del_conductor,'Barrera física'));
f46=find(strcmpi(x.Acera_lado_del_conductor,'Separación no física ≥ 3.0 m'));
f47=find(strcmpi(x.Acera_lado_del_conductor,'Separación no física 1.0 m a 3.0 m'));
f48=find(strcmpi(x.Acera_lado_del_conductor,'Separación no física 0 m < 1.0 m'));
f49=find(strcmpi(x.Acera_lado_del_conductor,'Ninguno'));
f50=find(strcmpi(x.Acera_lado_del_conductor,'Camino informal ≥ 1.0 m'));
f51=find(strcmpi(x.Acera_lado_del_conductor,'Camino informal de 0 m a < 1.0 m'));

g45=x.Distancia(f45);
g46=x.Distancia(f46);
g47=x.Distancia(f47);
g48=x.Distancia(f48);
g49=x.Distancia(f49);
g50=x.Distancia(f50);
g51=x.Distancia(f51);

h45=1/1000*sum(g45);
h46=1/1000*sum(g46);
h47=1/1000*sum(g47);
h48=1/1000*sum(g48);
h49=1/1000*sum(g49);
h50=1/1000*sum(g50);
h51=1/1000*sum(g51);

i45=(h45*100)/(1/1000*sum(x.Distancia));
i46=(h46*100)/(1/1000*sum(x.Distancia));
i47=(h47*100)/(1/1000*sum(x.Distancia));
i48=(h48*100)/(1/1000*sum(x.Distancia));
i49=(h49*100)/(1/1000*sum(x.Distancia));
i50=(h50*100)/(1/1000*sum(x.Distancia));
i51=(h51*100)/(1/1000*sum(x.Distancia));

%Noveno subatributo
f52=find(strcmpi(x.Acera_lado_del_copiloto,'Barrera física'));
f53=find(strcmpi(x.Acera_lado_del_copiloto,'Separación no física ≥ 3.0 m'));
f54=find(strcmpi(x.Acera_lado_del_copiloto,'Separación no física 1.0 m a 3.0 m'));
f55=find(strcmpi(x.Acera_lado_del_copiloto,'Separación no física 0 m < 1.0 m'));
f56=find(strcmpi(x.Acera_lado_del_copiloto,'Ninguno'));
f57=find(strcmpi(x.Acera_lado_del_copiloto,'Camino informal ≥ 1.0 m'));
f58=find(strcmpi(x.Acera_lado_del_copiloto,'Camino informal de 0 m a < 1.0 m'));

g52=x.Distancia(f52);
g53=x.Distancia(f53);
g54=x.Distancia(f54);
g55=x.Distancia(f55);
g56=x.Distancia(f56);
g57=x.Distancia(f57);
g58=x.Distancia(f58);

h52=1/1000*sum(g52);
h53=1/1000*sum(g53);
h54=1/1000*sum(g54);
h55=1/1000*sum(g55);
h56=1/1000*sum(g56);
h57=1/1000*sum(g57);
h58=1/1000*sum(g58);

i52=(h52*100)/(1/1000*sum(x.Distancia));
i53=(h53*100)/(1/1000*sum(x.Distancia));
i54=(h54*100)/(1/1000*sum(x.Distancia));
i55=(h55*100)/(1/1000*sum(x.Distancia));
i56=(h56*100)/(1/1000*sum(x.Distancia));
i57=(h57*100)/(1/1000*sum(x.Distancia));
i58=(h58*100)/(1/1000*sum(x.Distancia));

%Décimo subatributo
f59=find(strcmpi(x.Infraestructura_para_motocicletas,'Motovía exclusiva de un sentido con barrera'));
f60=find(strcmpi(x.Infraestructura_para_motocicletas,'Motovía exclusiva de un sentido sin barrera'));
f61=find(strcmpi(x.Infraestructura_para_motocicletas,'Motovía exclusiva de dos sentidos con barrera'));
f62=find(strcmpi(x.Infraestructura_para_motocicletas,'Motovía exclusiva de dos sentidos sin barrera'));
f63=find(strcmpi(x.Infraestructura_para_motocicletas,'Motovía compartida en la carretera'));
f64=find(strcmpi(x.Infraestructura_para_motocicletas,'Ninguno'));

g59=x.Distancia(f59);
g60=x.Distancia(f60);
g61=x.Distancia(f61);
g62=x.Distancia(f62);
g63=x.Distancia(f63);
g64=x.Distancia(f64);

h59=1/1000*sum(g59);
h60=1/1000*sum(g60);
h61=1/1000*sum(g61);
h62=1/1000*sum(g62);
h63=1/1000*sum(g63);
h64=1/1000*sum(g64);

i59=(h59*100)/(1/1000*sum(x.Distancia));
i60=(h60*100)/(1/1000*sum(x.Distancia));
i61=(h61*100)/(1/1000*sum(x.Distancia));
i62=(h62*100)/(1/1000*sum(x.Distancia));
i63=(h63*100)/(1/1000*sum(x.Distancia));
i64=(h64*100)/(1/1000*sum(x.Distancia));

%Décimo primero subatributo
f65=find(strcmpi(x.Infraestructura_para_bicicletas,'Ciclovía fuera de la carretera con barrera'));
f66=find(strcmpi(x.Infraestructura_para_bicicletas,'Ciclovía fuera de la carretera sin barrera'));
f67=find(strcmpi(x.Infraestructura_para_bicicletas,'Ciclovía en la carretera'));
f68=find(strcmpi(x.Infraestructura_para_bicicletas,'Ninguno'));
f69=find(strcmpi(x.Infraestructura_para_bicicletas,'Carril extra fuera de la calzada (≥ 4.2 m)'));
f70=find(strcmpi(x.Infraestructura_para_bicicletas,'Vía compartida con señalización vertical'));
f71=find(strcmpi(x.Infraestructura_para_bicicletas,'Ciclovía de uso compartido'));

g65=x.Distancia(f65);
g66=x.Distancia(f66);
g67=x.Distancia(f67);
g68=x.Distancia(f68);
g69=x.Distancia(f69);
g70=x.Distancia(f70);
g71=x.Distancia(f71);

h65=1/1000*sum(g65);
h66=1/1000*sum(g66);
h67=1/1000*sum(g67);
h68=1/1000*sum(g68);
h69=1/1000*sum(g69);
h70=1/1000*sum(g70);
h71=1/1000*sum(g71);

i65=(h65*100)/(1/1000*sum(x.Distancia));
i66=(h66*100)/(1/1000*sum(x.Distancia));
i67=(h67*100)/(1/1000*sum(x.Distancia));
i68=(h68*100)/(1/1000*sum(x.Distancia));
i69=(h69*100)/(1/1000*sum(x.Distancia));
i70=(h70*100)/(1/1000*sum(x.Distancia));
i71=(h71*100)/(1/1000*sum(x.Distancia));

%Décimo segundo subatributo
f72=find(strcmpi(x.Advertencia_de_zona_escolar,'Balizas intermitentes en zona escolar'));
f73=find(strcmpi(x.Advertencia_de_zona_escolar,'Señalización estática o demarcación horizontal en zona escolar'));
f74=find(strcmpi(x.Advertencia_de_zona_escolar,'Sin señal de advertencia de zona escolar'));
f75=find(strcmpi(x.Advertencia_de_zona_escolar,'No aplica (no hay escuela en el lugar)'));

g72=x.Distancia(f72);
g73=x.Distancia(f73);
g74=x.Distancia(f74);
g75=x.Distancia(f75);

h72=1/1000*sum(g72);
h73=1/1000*sum(g73);
h74=1/1000*sum(g74);
h75=1/1000*sum(g75);

i72=(h72*100)/(1/1000*sum(x.Distancia));
i73=(h73*100)/(1/1000*sum(x.Distancia));
i74=(h74*100)/(1/1000*sum(x.Distancia));
i75=(h75*100)/(1/1000*sum(x.Distancia));

%Décimo tercero subatributo
f76=find(strcmpi(x.Supervisor_en_el_cruce_de_zona_escolar,'Supervisor de cruce en zona escolar presente en horario de entrada y salida de la escuela'));
f77=find(strcmpi(x.Supervisor_en_el_cruce_de_zona_escolar,'Supervisor de cruce en zona escolar no presente'));
f78=find(strcmpi(x.Supervisor_en_el_cruce_de_zona_escolar,'No aplica (no hay escuela en el lugar)'));

g76=x.Distancia(f76);
g77=x.Distancia(f77);
g78=x.Distancia(f78);

h76=1/1000*sum(g76);
h77=1/1000*sum(g77);
h78=1/1000*sum(g78);

i76=(h76*100)/(1/1000*sum(x.Distancia));
i77=(h77*100)/(1/1000*sum(x.Distancia));
i78=(h78*100)/(1/1000*sum(x.Distancia));
end