%Información de ingreso
A1=char('Nombre del proyecto: ','Tramo: ', 'Creado por: ', 'Fecha: ', 'Nombre del archivo: ');
D1=char('Carretera Loja-Zamora','0+100','Jefferson D. Montoya','01-02-2021','Reporte N#1');
U=char('m','%');

%Estructura arreglo
E.Texto=A1;
E.Texto1=D1;
E.Unidades=U;

S1=strcat(E(1).Texto(1,:),E(1).Texto1(1,:));
S2=strcat(E(1).Texto(2,:),E(1).Texto1(2,:));
S3=strcat(E(1).Texto(3,:),E(1).Texto1(3,:));
S4=strcat(E(1).Texto(4,:),E(1).Texto1(4,:));
S5=strcat(E(1).Texto(5,:),E(1).Texto1(5,:));

%Datos interfaz geometría
T1=char('Radio:','Pendiente:','Ancho carril:');

%Estructura arreglo
E.Texto2=T1;

Datos=[];
Radio=30;
Pendiente=2;
Carril=3.25;
Datos(1)=Radio;
Datos(2)=Pendiente;
Datos(3)=Carril;
Datos_geometria=Datos';
B=num2str(Datos_geometria);
%Estructura arreglo
E.Matriz=B;

R1=strcat(E(1).Texto2(1,:),E(1).Matriz(1,:),E(1).Unidades(1,:));
P1=strcat(E(1).Texto2(2,:),E(1).Matriz(2,:),E(1).Unidades(2,:));
Anc1=strcat(E(1).Texto2(3,:),E(1).Matriz(3,:),E(1).Unidades(1,:));

%Datos interfaz atributos
%1.Costado de vía
c_v=char('Severidad lateral-distancia al objeto-lado conductor: ','Severidad lateral-objeto-lado conductor: '...
                 ,'Severidad lateral-distancia al objeto-lado copiloto: ','Severidad lateral-objeto-lado copiloto: '...
                 ,'Banda de alerta en el acotamiento: ','Acotamiento lado del conductor: ','Acotamiento lado del copiloto: ');

%Estructura arreglo
E.Nom_cv=c_v;

Severidad_lateral_distancia_al_objeto_lado_conductor= '>= 10 m ';
Severidad_lateral_objeto_lado_conductor='Árbol >=10 cm';
Severidad_lateral_distancia_al_objeto_lado_copiloto= '>= 10 m ';
Severidad_lateral_objeto_lado_copiloto='Árbol >=10 cm'; 
Banda_de_alerta_en_el_acotamiento='No presente'; 
Ancho_carril_lado_del_conductor='Ninguno'; 
Ancho_carril_lado_del_copiloto='Ninguno';

E.Costado_via=Severidad_lateral_distancia_al_objeto_lado_conductor;
E(2).Costado_via=Severidad_lateral_objeto_lado_conductor;
E(3).Costado_via=Severidad_lateral_distancia_al_objeto_lado_copiloto;
E(4).Costado_via=Severidad_lateral_objeto_lado_copiloto;
E(5).Costado_via=Banda_de_alerta_en_el_acotamiento;
E(6).Costado_via=Ancho_carril_lado_del_conductor;
E(7).Costado_via=Ancho_carril_lado_del_copiloto;

C_v1=strcat(E(1).Nom_cv(1,:),E(1).Costado_via);
C_v2=strcat(E(1).Nom_cv(2,:),E(2).Costado_via);
C_v3=strcat(E(1).Nom_cv(3,:),E(3).Costado_via);
C_v4=strcat(E(1).Nom_cv(4,:),E(4).Costado_via);
C_v5=strcat(E(1).Nom_cv(5,:),E(5).Costado_via);
C_v6=strcat(E(1).Nom_cv(6,:),E(6).Costado_via);
C_v7=strcat(E(1).Nom_cv(7,:),E(7).Costado_via);

%Reporte
import mlreportgen.report.*
import mlreportgen.dom.*
rpt = Report(' Reporte Final', 'pdf');

%Portada
titlepg = TitlePage;
titlepg.Title = 'CLASIFICACIÓN POR ESTRELLAS';
titlepg.Subtitle = 'Reporte detallado';
titlepg.Author = 'UNIVERSIDAD TÉCNICA PARTICULAR DE LOJA-SISTEMA INTEGRADO DE EVALUACIÓN DE CARRETERAS';
titlepg.Image ='Escudo_2.jpg';
%add(rpt,titlepg);

%Tabla de contenidos
%add(rpt,TableOfContents);

%Capítulos
%Capítulo 1
chap1 = Chapter;
chap1.Title ='Información del archivo';

add(chap1,Paragraph(S1));
add(chap1,Paragraph(S2)); 
add(chap1,Paragraph(S3)); 
add(chap1,Paragraph(S4)); 
add(chap1,Paragraph(S5)); 
add(rpt,chap1);

%Capítulo 2
chap2 = Chapter;
chap2.Title ='Configuración de análisis';
add(chap2,Paragraph('Interfaz geometría:')); 
add(chap2,Paragraph(R1));
add(chap2,Paragraph(P1)); 
add(chap2,Paragraph(Anc1));
add(chap2,Paragraph('Interfaz atributos:'));
add(chap2,'Imagen del tramo en análisis:');
add(chap2,FormalImage('Image',...
    which('Tramo.jpg'),'Height','1in',...
    'Width','1in','Caption','Boeing 747'));                  
add(chap2,Paragraph('Atributos codificados')); 
add(chap2,Paragraph('Costado de la vía:')); 
add(chap2,Paragraph(C_v1));
add(chap2,Paragraph(C_v2));
add(chap2,Paragraph(C_v3));
add(chap2,Paragraph(C_v4));
add(chap2,Paragraph(C_v5));
add(chap2,Paragraph(C_v6));
add(chap2,Paragraph(C_v7));
add(rpt,chap2);

%Capítulo 3
chap3 = Chapter;
chap3.Title ='Desarrollo del análisis';
sec3_1 = Section; 
sec3_1.Title = '1.-Clasificación por Estrellas para Ocupante del vehículo';
texto1 = Paragraph('a)	Salida del camino (lado del conductor))');
texto2 = Paragraph('Atributos viales (probabilidad)');
texto3 = Paragraph(['Cuando la categoría del atributo vial ancho del carril es en la'...
    ' zona urbana de la Tabla 2 para ocupante de vehículo y salida del camino nos da un factor de riesgo de']);
add(sec3_1,texto1);
add(sec3_1,texto2);
add(sec3_1,texto3);
add(chap3,sec3_1);

sec3_2 = Section; 
sec3_2.Title = '2.- Clasificación por Estrellas para Motocicletas';
add(chap3,sec3_2);

sec3_3 = Section; 
sec3_3.Title = '3.- Clasificación por Estrellas para ciclistas';
add(chap3,sec3_3);

sec3_4 = Section; 
sec3_4.Title = '4.- Clasificación por Estrellas para peatones';
add(chap3,sec3_4);

add(rpt,chap3);

%Capítulo 4
chap4 = Chapter;
chap4.Title ='Reporte completo';
square = magic(10); 
tbl = Table(square); 

tbl.Style = {... 
    RowSep('solid','black','1px'),... 
    ColSep('solid','black','1px'),}; 
tbl.Border = 'double'; 
tbl.TableEntriesStyle = {HAlign('center')}; 

add(chap4,tbl); 
add(rpt,chap4); 


%Paso Final
close(rpt);
rptview(rpt);