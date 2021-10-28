function myui_12_04_2015

        %% define the program parameters
    %timer function params
    p.j=1;
    p.t=0;
    p.dt=.01;
    p.tstop=100;
    % system model parameters (as global vars)
    p.g=9.8;  %m/s^2

    p.m=15;
    p.k=2;
    p.c=1;

    p.wn=sqrt(p.k/p.m);
    p.dr=p.c/(2*sqrt(p.m*p.k));
    p.wd=p.wn*sqrt(1-p.dr^2);

    p.x1_0=0; %state variables, initial values
    p.x2_0=0;

    % control sytem params 
    p.f=0; %actuator input
    p.xref=0;
    p.kp=12;
    p.ki=0;
    p.kd=0;
    
    % GUI parameters
    sld_x=50;
    sld_y=200;
    sld_h=20;  %slider height
    sld_w=120; %slider width 
    sld_hs=sld_h+25; %slider vertical separation
    sld_ws=sld_w+20;
    sld_rect=[sld_x sld_y sld_w sld_h];
    pid_rect=[sld_x sld_y+300 sld_w sld_h];
    
    fsize=14;

    % Create a figure and axes
    f = figure('Visible','off');
    % Create push button - Welcome button
    bstr=sprintf('TTU ME3050');
    btn = uicontrol('Style', 'pushbutton', 'String',bstr,...
        'FontSize',fsize,...
        'Position', [50 500 200 50],...
        'Callback', @reset_cb);  
    % Make figure visble after adding all components
%     f.Visible = 'on';
    set(f,'Visible','on')
    
    %dummy multi scope vars
    %create the timer object 
    ah=[];
    th=timer;
    l1=[];
    l2=[];
    l3=[];
    bx=[];
    
    %define the GUI callbacks
    function mass_cb(source,callbackdata)
        val = get(source,'Value');
        p.m=val;
        update_model();
        str=sprintf(': %f (kg)',p.m);
    end
    function damper_cb(source,callbackdata)
        val = get(source,'Value');
        p.c=val;
        update_model();  
    end
    function spring_cb(source,callbackdata)
        val = get(source,'Value');
        p.k=val;
        update_model();  
    end

    function xref_cb(source,callbackdata)
        val = get(source,'Value');
        p.xref=val;
        update_model();     
    end
    function kp_cb(source,callbackdata)
        val = get(source,'Value');
        p.kp=val;
        update_model();     
    end
    function ki_cb(source,callbackdata)
        val = get(source,'Value');
        p.ki=val;
        update_model();     
    end
    function kd_cb(source,callbackdata)
        val = get(source,'Value');
        p.kd=val;
        update_model();     
    end
    
    
%     function frequency_cb(source,callbackdata)
%         val = get(source,'Value');
%         p.w=val;     
%         update_model();
%     end
    
    function reset_cb(source,callbackdata)
        update_model();
        stop(th);
        th=timer;
        % prepare the plot
        ah=axes('xlim',[-5,10],'ylim',[-15,15]);
        set(ah,'Position',[0.250 0.1100 0.70 0.8150])
        grid on
        
       
        
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
        
        l3=line(p.t,p.x1_0,...
            'userdata',0,...
            'marker','.',...
            'color','black',...
            'markersize',2,...
            'linestyle',':');
        
        %draw a box
        p.bht=1;
        p.bwt=1;
        p.bps=5;
        px=[0 p.bwt p.bwt 0]+p.bps;
        py=[0 0 p.bht p.bht]-p.bht/2+p.x1_0;
        % 
        bx=patch(px,py,'red',...
                'userdata',0,...
                'marker','none',...
                'linestyle','-');
        
        shg; % show graph window   

        % Create push button - Start
        btn = uicontrol('Style', 'pushbutton', 'String', 'Reset',...
            'FontSize',fsize,...
            'Position', [50 450 100 40],...
            'Callback', @reset_cb);

        % Create push button - Reset
        btn = uicontrol('Style', 'pushbutton', 'String', 'Start',...
            'FontSize',fsize,...
            'Position', [150 450 100 40],...
            'Callback', @start_cb);
       
        %%% SLIDER BARS %%%
        % Input Reference 
        sld = uicontrol('Style', 'slider',...
            'Min',0,'Max',10,'Value',p.xref,...
            'Position', sld_rect+[0 3*sld_hs 0 0],...
            'Callback', @xref_cb); 
        % Add text 
        txt = uicontrol('Style','text',...
            'Position',sld_rect+[0 3*sld_hs+sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','xref');
        
        % Mass
        sld = uicontrol('Style', 'slider',...
            'Min',1,'Max',100,'Value',p.m,...
            'Position', sld_rect+[0 2*sld_hs 0 0],...
            'SliderStep',[0.001 0.001],...
            'Callback', @mass_cb); 
        % Add text
        txt = uicontrol('Style','text',...
            'Position',sld_rect+[0 2*sld_hs+sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','mass');
        
        % Damping constant
        sld = uicontrol('Style', 'slider',...
            'Min',1,'Max',1000,'Value',p.c,...
            'Position', sld_rect+[0 sld_hs 0 0],...
            'Callback', @damper_cb); 
        % Add  text
        txt = uicontrol('Style','text',...
            'Position',sld_rect+[0 sld_hs+sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','damper');
        
        % Spring constant
        sld = uicontrol('Style', 'slider',...
            'Min',1,'Max',1000,'Value',p.c,...
            'Position', sld_rect,...
            'Callback', @spring_cb); 
        % Add  text
        txt = uicontrol('Style','text',...
            'Position',sld_rect+[0 sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','spring');
        % sliders for control gains
        
        % P
        sld = uicontrol('Style', 'slider',...
            'Min',-50,'Max',50,'Value',p.kp,...
            'Position', pid_rect+[0 2*sld_hs 0 0],...
            'SliderStep',[0.001 0.001],...
            'Callback', @kp_cb); 
        % Add text
        txt = uicontrol('Style','text',...
            'Position',pid_rect+[0 2*sld_hs+sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','Kp');

        % I
        sld = uicontrol('Style', 'slider',...
            'Min',-50,'Max',50,'Value',p.ki,...
            'Position', pid_rect+[0 sld_hs 0 0],...
            'Callback', @ki_cb); 
        % Add  text
        txt = uicontrol('Style','text',...
            'Position',pid_rect+[0 sld_hs+sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','Ki');
        
        % D
        sld = uicontrol('Style', 'slider',...
            'Min',-50,'Max',50,'Value',p.kd,...
            'Position', pid_rect,...
            'Callback', @kd_cb); 
        % Add  text
        txt = uicontrol('Style','text',...
            'Position',pid_rect+[0 sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','Kd');
              
        % Make figure visble after adding all components
        set(f,'Visible','on')

    end

    function start_cb(source,callbackdata)
     
        th.TimerFcn={@model_mck_12_04_2015,p,l1,l2,l3,bx,ah};
        th.StopFcn={@model_stop};
        set(th,...
            'period',p.dt,...
            'TasksToExecute', round(p.tstop/p.dt),...
            'executionmode','fixedrate');
        start(th);
     
    end
    
    function update_model() 
        
             %recalculate after params have been changed
        p.tau=p.m/p.c;               %time constant

%         ah=axes('xlim',[-1,2*1/p.w],'ylim',[-15,15]);
        p.wn=sqrt(p.k/p.m);
        p.dr=p.c/(2*sqrt(p.m*p.k));
%         p.r=p.w/p.wn;
        
%         p.M=1/sqrt((1-p.r^2)^2+(2*p.dr*p.r)^2); %amplitude ratio 
%       

%         p.phi=atan(2*p.dr*p.r/(1-p.r^2));  

        str=sprintf('Kp: %6.2f\n\nKi : %6.2f\n\nKd : %6.2f\n\n',p.kp,p.ki,p.kd);
        txt = uicontrol('Style','text',...
            'FontSize',fsize,...
            'Position',[175 sld_y+200 100 200],...
            'String',str);    
            
        str=sprintf('xref: %6.2f\n\nm : %6.2f\n\nc : %6.2f\n\nk : %6.2f\n\n',p.xref,p.m,p.c,p.k);
        txt = uicontrol('Style','text',...
            'FontSize',fsize,...
            'Position',[175 sld_y-50 100 200],...
            'String',str);
        str=sprintf('\nwn : %6.2f\ndr : %6.2f\n',p.wn,p.dr);
        txt = uicontrol('Style','text',...
            'FontSize',fsize,...
            'Position',[100 sld_y-150 100 120],...
            'String',str);
        
        th.TimerFcn={@model_mck_12_04_2015,p,l1,l2,l3,bx,ah};%update the graph in motion (need transients to work)
        
%        show_bode()
               
    end
% 
%     function show_bode()
%      % show the bode plot
%         f2=figure(2);
%         clf
%         sys=tf(p.wn^2,[1 2*p.dr*p.wn p.wn^2]);
%         bode(sys)
%         set(0,'CurrentFigure',f)
%     end
end