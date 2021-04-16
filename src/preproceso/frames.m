%%============================
global vbo;
if (0 == size(vbo,1))
	error 'Load a VBO file first.';
end
%% INFORMACION 
[Filename, pathname]=uigetfile('*.avi')
video=Filename
Video_Properties = VideoReader(Filename);
Number_Frames_x_s = Video_Properties.FrameRate;

%%
tiempo=vbo.channels(13).data;
tiempo=vbo.channels(13).data;
TIEMPO_TRAMOS=tiempo(Prox,1)*Number_Frames_x_s
Time_tram= round(TIEMPO_TRAMOS)
%%
ReadObj = VideoReader(Filename); 

CurFrame = 0;

GetFrame =Time_tram;

while hasFrame(ReadObj)

 CurImage = readFrame(ReadObj);

 CurFrame = CurFrame+1;

 if ismember(CurFrame, GetFrame)

 imwrite(CurImage, sprintf('frame%d.jpg', CurFrame));
 end

end