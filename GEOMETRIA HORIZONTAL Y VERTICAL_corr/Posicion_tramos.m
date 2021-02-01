%%============================
global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end

%%Seleccion del inicio y fin de la ruta de estudio
Longitud = vbo.channels(4).data;
pi_1 = info_struct.Position;
pf_1 = info_struct2.Position;
pi1=pi_1(1,1);
pf1=pf_1(1,1);
pni1 = find(Longitud==pi1);
pnf2 = find(Longitud==pf1);
[minimo1,position1]=min(abs(Longitud-(pni1)));
[minimo2,position2]=min(abs(Longitud-(pnf2)));
Posic1=position1;
Posic2=position2;
%%Identificación de la zona de estudio
Distancia = vbo.channels(15).data;
Zni = [Posic1;Posic2];
Intr = Distancia(min(Zni),1)
Fntr = Distancia(max(Zni),1)
i = input('Tramo de inicio')
%%Extracción de ubicaciones distancia
if i = 0:100:Fntr
   disp('Analisis de todos los tramos')
else 
    if i = i:100:Fntr
        disp('Absc especificada')
    end
end

[minimo,position]=min(abs(Distancia-(i)));
Prox=position(:);
disp(Prox);