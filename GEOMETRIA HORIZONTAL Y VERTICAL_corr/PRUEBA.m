global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end
%%
% vbograph - demo graphing a loaded VBO file, time vs velocity

xvar = 'exported_distance';
yvar = 'height';

%% Carga de datos 

global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end
%%
latitud = vbo.channels(3).data;
longitud = vbo.channels(4).data;
%%
pf=PROX(1,1)
xf=longitud(pf,1)
x=longitud(1:pf,1)
y=latitud(1:pf,1)

%% find the channels by name

xchan = 0;
ychan = 0;

for chan = 1:size(vbo.channels,2)
	if (1 == strcmp(xvar, vbo.channels(chan).name))
		xchan = chan;
	elseif (1 == strcmp(yvar, vbo.channels(chan).name))
		ychan = chan;
	end
end

if (xchan == 0)
	fprintf(1, '\n*** X-channel "%s" not found in VBO file!\n\n', xvar);
	error('See above');
end
if (ychan == 0)
	fprintf(1, '\n*** Y-channel "%s" not found in VBO file!\n\n', yvar);
	error('See above');
end
fig = figure
plot(vbo.channels(xchan).data, vbo.channels(ychan).data);

xlabel(sprintf('%s (%s)', vbo.channels(xchan).name, vbo.channels(xchan).units));
ylabel(sprintf('%s (%s)', vbo.channels(ychan).name, vbo.channels(ychan).units));

%% Coordenadas de puntos seleccionados

% Enable data cursor mode
datacursormode on
dcm_obj = datacursormode(fig);
% Set update function
set(dcm_obj,'UpdateFcn',@myupdatefcn)

% Wait while the user to click
disp('Seleccionar punto 1, press "Enter"')
pause 
% Export cursor to workspace
info_struct = getCursorInfo(dcm_obj);
if isfield(info_struct, 'Position')
  disp('Clicked positioin is')
  disp(info_struct.Position)
end
%%
datacursormode on
dcm_obj = datacursormode(fig);
% Set update function
set(dcm_obj,'UpdateFcn',@myupdatefcn)

% Wait while the user to click
disp('Seleccionar punto 2, press "Enter"')
pause 
% Export cursor to workspace
info_struct2 = getCursorInfo(dcm_obj);
if isfield(info_struct2, 'Position')
  disp('Clicked positioin is')
  disp(info_struct2.Position)
end

function output_txt = myupdatefcn(~,event_obj)
  % ~            Currently not used (empty)
  % event_obj    Object containing event data structure
  % output_txt   Data cursor text
  pos = get(event_obj, 'Position');
  output_txt = {['x: ' num2str(pos(1))], ['y: ' num2str(pos(2))]};
end

