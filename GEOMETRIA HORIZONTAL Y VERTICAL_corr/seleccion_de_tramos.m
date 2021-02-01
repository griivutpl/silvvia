%%============================
global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end
Distancia = vbo.channels(15).data;
altura = vbo.channels(7).data;
Absini = Distancia(1,1);

Absfin = Distancia(end,1);
%%
Prin_Prfi = sprintf('Desde progresiva %d hasta progresiva %d',Absini,Absfin);
disp(Prin_Prfi)
i= input('¿Desea iniciar desde la prograsiva 0+000? S/N : ', 's')
w=input('INGRESE LA DISTANCIA ENTRE TRAMOS')
if i == 'S'
    i = 0:w:Absfin;
else i = 'N'
    ini = input('Ingrese abscisa inicial : ')
    inf = input('Ingrese abscisa final : ')
    i = ini:w:inf;
end

[minimo,position]=min(abs(Distancia-(i)));
Prox=position(:);
%%
lat = vbo.channels(3).data;
long = vbo.channels(4).data;
plot(long,lat)