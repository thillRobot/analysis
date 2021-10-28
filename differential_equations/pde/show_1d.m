function show_1d( T )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    global L n dx x alpha M dt 

    x0 = 0;     %location of first node
    y0 = -1;
    h = 10;     %height of bar
    wallw=1;
    wallh=.8;
    n = 100;    %number of nodes in bar

    T_color=mapminmax(T,1,64)
    
    colormap('hot')
    cmap =colormap;
    %draw the bar 
    for i=1:(length(T))
        if i==1
    %         wall.vertices=[x0-wallw y0-wallh/2
    %                    x0-wallw y0+wallh/2
    %                    x0 y0+wallh/2
    %                    x0 y0-wallh/2
    %                    x0-wallw y0-wallh/2  ];
    %         wall.faces   = 1:length(wall.vertices);
    %         wall.facecolor =cmap(round(T0)+1,:);%cmap(round(T(i)),:);
    %         patch(wall)
        elseif i==n+2
    %         wall.vertices=[L y0-wallh/2
    %                    L y0+wallh/2
    %                    L+wallw y0+wallh/2
    %                    L+wallw y0-wallh/2
    %                    L y0-wallh/2  ];
    %         wall.faces   = 1:length(wall.vertices);
    %         wall.facecolor =cmap(round(TL)+1,:);
    %         patch(wall)
        else
            node.vertices=[x0+dx*(i-2) y0
                       x0+dx*(i-2) y0+h
                       x0+dx*(i-1) y0+h
                       x0+dx*(i-1) y0
                       x0+dx*(i-2) y0  ];
            node.faces   = 1:length(node.vertices);
            node.facecolor =cmap(round(T_color(i)),:);
            node.edgecolor ='white';
            patch(node)
        end
    end
end

