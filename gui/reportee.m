import mlreportgen.report.*
rpt = mlreportgen.report.Report('output','pdf');
chapter = mlreportgen.report.Chapter();
chapter.Title = 'Formal Image Reporter Example';

image = mlreportgen.report.FormalImage();
image.Image = which('1.jpg');
image.Caption = 'Cat''s Eye Nebula or NGC 6543';
image.Height = '5in';

add(chapter,image);
add(rpt,chapter);
rptview(rpt);