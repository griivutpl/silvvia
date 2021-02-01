
% vbograph - demo graphing a loaded VBO file, time vs velocity

xvar =Xt;
yvar =yt;

%% Carga de datos 

global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end

%%
fig = figure
plot(xvar,yvar);
sgt = sgtitle('Selecciona punto medio de la curva','Color','red');
sgt.FontSize =15;
xlabel('x');
ylabel('y');
grid on

%% Coordenadas de puntos seleccionados

% Enable data cursor mode
datacursormode on
dcm_obj = datacursormode(fig);
% Set update function
set(dcm_obj,'UpdateFcn',@myupdatefcn)
% Wait while the user to click
disp('Seleccionar punto medio de la curva, press "Enter"')
pause 
% Export cursor to workspace
info_struct = getCursorInfo(dcm_obj);
if isfield(info_struct, 'Position')
  disp('Clicked positioin is')
  disp(info_struct.Position)
end
function output_txt = myupdatefcn(~,event_obj)
  % ~            Currently not used (empty)
  % event_obj    Object containing event data structure
  % output_txt   Data cursor text
  pos = get(event_obj, 'Position');
  output_txt = {['x: ' num2str(pos(1))], ['y: ' num2str(pos(2))]};
end
