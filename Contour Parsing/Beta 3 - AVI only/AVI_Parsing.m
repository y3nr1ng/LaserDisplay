clear;

xyloObj = VideoReader('..\rbc.avi');

nFrames = xyloObj.NumberOfFrames;
vidHeight = xyloObj.Height;
vidWidth = xyloObj.Width;

% Preallocate movie structure.
mov(1:nFrames) = ...
    struct('cdata', zeros(vidHeight, vidWidth, 3, 'uint8'),...
           'colormap', []);
contour(1:nFrames) = ...
    struct('frame', zeros(1000000, 3, 'uint8'));

% Read one frame at a time.
for k = 1 : nFrames
    mov(k).cdata = read(xyloObj, k);
    [gray, MAP]=frame2im(mov(k));
    [Tpic, SMpic] = graythresh(gray);
    threshold = im2bw(gray, Tpic);
    output =  edge(threshold, 'prewitt');
    contour(k).frame = output;
end

for n=1:length(contour)
    spy(contour(1,n).frame);
    M(n)=getframe;
end

%movie(M, 2, xyloObj.FrameRate);
