function myui_12_04_2015
%% define the program parameters
%timer function params
p.j=1;
p.t=0;
p.dt=.01;
p.tstop=15;
% system model parameters (as global vars)
p.g=9.8;  %m/s^2

p.m=15;
p.k=2;
p.c=1;

p.wn=sqrt(p.k/p.m);
p.dr=p.c/(2*sqrt(p.m*p.k));
p.wd=p.wn*sqrt(1-p.dr^2);

p.x1_0=2; %state variables, initial values
p.x2_0=0;

% control sytem params 
p.f=0; %actuator input
p.xref=3;
p.kp=12;

%% prepare the plot
figure(1)
axes('xlim',[-5,15],'ylim',[-5,5]);
grid on

%draw a box
p.bht=1;
p.bwt=1;
p.bps=-3;
px=[0 p.bwt p.bwt 0]+p.bps;
py=[0 0 p.bht p.bht]-p.bht/2+p.x1_0;
% 
box=patch(px,py,'red',...
    'userdata',0,...
    'marker','none',...
    'linestyle','-');

%draw a few lines 
l1=line(p.t,p.x1_0,...
    'userdata',0,...
    'marker','.',...
    'color','red',...
    'markersize',2,...
    'linestyle','-');

l2=line(p.t,p.x2_0,...
    'userdata',0,...
    'marker','.',...
    'color','blue',...
    'markersize',2,...
    'linestyle','-');

% Create a figure and axes
f = figure('Visible','off');
%     ax = axes('Units','pixels');
% Create push button - Welcome button
btn = uicontrol('Style', 'pushbutton', 'String', 'ME 3050 Dynamics Simulator',...
    'Position', [150 390 200 30],...
    'Callback', @reset_cb);  
% Make figure visble after adding all components
set(f,'Visible','on');
    
  
%create the timer object 
th=timer;
l=[]; %dummy multi scope vars
box=[];
    
    %define the GUI callbacks
    function mass_cb(source,callbackdata)
        val = 1000 - get(source,'Value');
        p.m=val;
          %recalculate after params have been changed
        p.wn=sqrt(p.k/p.m);
        p.dr=p.c/(2*sqrt(p.m*p.k));
        p.wd=p.wn*sqrt(1-p.dr^2);
        show_case()
        p
    end
    function damper_cb(source,callbackdata)
        val = 1000 - get(source,'Value');
        p.c=val;
          %recalculate after params have been changed
        p.wn=sqrt(p.k/p.m);
        p.dr=p.c/(2*sqrt(p.m*p.k));
        p.wd=p.wn*sqrt(1-p.dr^2);
        show_case()
        p
    end
    function spring_cb(source,callbackdata)
        val = 1000 - get(source,'Value');
        p.k=val;
          %recalculate after params have been changed
        p.wn=sqrt(p.k/p.m);
        p.dr=p.c/(2*sqrt(p.m*p.k));
        p.wd=p.wn*sqrt(1-p.dr^2);
        show_case()
        p
    end
    
    function reset_cb(source,callbackdata)
        stop(th)
        th=timer;
        % prepare the plot
        axes('xlim',[-10,15],'ylim',[-10,15]);
        grid on
        %draw a few lines 
        l1=line(p.t,p.x1_0,...
            'userdata',0,...
            'marker','.',...
            'color','blue',...
            'markersize',2,...
            'linestyle','-');

        l2=line(p.t,p.x2_0,...
            'userdata',0,...
            'marker','.',...
            'color','blue',...
            'markersize',2,...
            'linestyle','.');
        shg; % show graph window   
        show_case()
        % Create push button - Start
        btn = uicontrol('Style', 'pushbutton', 'String', 'Reset',...
            'Position', [100 20 50 20],...
            'Callback', @reset_cb);

        % Create push button - Reset
        btn = uicontrol('Style', 'pushbutton', 'String', 'Start',...
            'Position', [150 20 50 20],...
            'Callback', @start_cb);

       % Create slider - mass
        sld = uicontrol('Style', 'slider',...
            'Min',1,'Max',1000,'Value',41,...
            'Position', [400 20 120 20],...
            'Callback', @mass_cb); 

        % Add a text uicontrol to label the slider.
        txt = uicontrol('Style','text',...
            'Position',[400 40 120 20],...
            'String','mass');
        
        % Create slider - damping constant
        sld = uicontrol('Style', 'slider',...
            'Min',1,'Max',1000,'Value',41,...
            'Position', [400 60 120 20],...
            'Callback', @damper_cb); 

        % Add a text uicontrol to label the slider.
        txt = uicontrol('Style','text',...
            'Position',[400 80 120 20],...
            'String','damper');
        
        % Create slider - spring constant
        sld = uicontrol('Style', 'slider',...
            'Min',1,'Max',1000,'Value',41,...
            'Position', [400 100 120 20],...
            'Callback', @spring_cb); 

        % Add a text uicontrol to label the slider.
        txt = uicontrol('Style','text',...
            'Position',[400 120 120 20],...
            'String','spring');

        % Make figure visble after adding all components
        set(f,'Visible','on');

    end

    function start_cb(source,callbackdata)
     
        th.TimerFcn={@model_mck_12_03_2015,p,l1,l2,box};
        th.StopFcn={@model_stop};
        set(th,...
            'period',p.dt,...
            'TasksToExecute', round(p.tstop/p.dt),...
            'executionmode','fixedrate');
        start(th);
     
    end

    function show_case()
         % Add a text uicontrol to label the slider.

         if p.dr==1
             case_str=sprintf('Damping Ratio: %f\n Critically Damped',p.dr);
         elseif p.dr>1
             case_str=sprintf('Damping Ratio: %f\n Overdamped',p.dr);
         else
             case_str=sprintf('Damping Ratio: %f\n Underamped',p.dr);
         end
         txt = uicontrol('Style','text',...
            'Position',[150 360 200 30],...
            'String',case_str);
        
    end
    

end