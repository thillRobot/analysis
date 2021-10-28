function myui_second_order

    %define timer function params
    p.j=1;
    p.t=0;
    p.dt=.01;

    %define the system parameters    
    p.g=9.8; %m/s^2
    p.m=100; 
    p.c=100;
    p.k=100; 
    
    %define input signal (freq response)
    
    p.w=1; % input frequency (rad/s)
    p.A=1; % input amplitude (units)
    
    % zero initial conditions
    p.y0=0;

   % Create a figure and axes
    f = figure('Visible','off');
    set(f,'Position',[0 0 1200 600])
    
    %     ax = axes('Units','pixels');
   
    %create the timer object 
    th=timer;
    l_in=[]; %dummy multi scope vars
    l_out=[]; %dummy multi scope vars
    
    % GUI parameters
    sld_x=50;
    sld_y=200;
    sld_h=20;  %slider height
    sld_w=120; %slider width 
    sld_hs=sld_h+25; %slider vertical separation
    sld_ws=sld_w+20;
    sld_rect=[sld_x sld_y sld_w sld_h];
    
    fsize=14;
%     ah=[];
    
    % Create push button - Welcome button
    bstr=sprintf('TTU ME3050');
    btn = uicontrol('Style', 'pushbutton', 'String',bstr,...
        'FontSize',fsize,...
        'Position', [50 500 200 50],...
        'Callback', @reset_cb);  
    % Make figure visble after adding all components
%     f.Visible = 'on';
    set(f,'Visible','on')
    %define the GUI callbacks
    function mass_cb(source,callbackdata)
        val = get(source,'Value');
        p.m=val;
        update_model();
        str=sprintf(': %f (kg)',p.m);
% %         text(sld_rect(1)+sld_ws+50,sld_hs,str)
%         text(0,0,str)
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

    function amplitude_cb(source,callbackdata)
        val = get(source,'Value');
        p.A=val;
        update_model();     
    end

    function frequency_cb(source,callbackdata)
        val = get(source,'Value');
        p.w=val;     
        update_model();
    end
    
    function reset_cb(source,callbackdata)
        update_model();
        stop(th);
        th=timer;
        % prepare the plot
        ah=axes('xlim',[-1,10],'ylim',[-15,15]);
        set(ah,'Position',[0.250 0.1100 0.70 0.8150])
        grid on
        l_in=line(p.t,p.y0,...
            'userdata',0,...
            'marker','.',...
            'color','black',...
            'markersize',2,...
            'linestyle','-');

        l_out=line(p.t,p.y0,...
            'userdata',0,...
            'marker','.',...
            'color','red',...
            'markersize',2,...
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
        % Input Amplitude
        sld = uicontrol('Style', 'slider',...
            'Min',0,'Max',10,'Value',p.A,...
            'Position', sld_rect+[0 4*sld_hs 0 0],...
            'Callback', @amplitude_cb); 
        % Add text 
        txt = uicontrol('Style','text',...
            'Position',sld_rect+[0 4*sld_hs+sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','amplitude');
        
        % Input Frequency
        sld = uicontrol('Style', 'slider',...
            'Min',1,'Max',100,'Value',p.w,...
            'Position', sld_rect+[0 3*sld_hs 0 0],...
            'SliderStep',[0.001 0.001],...
            'Callback', @frequency_cb); 
        % Add text 
        txt = uicontrol('Style','text',...
            'Position',sld_rect+[0 3*sld_hs+sld_hs/2 0 0],...
            'FontSize',fsize,...
            'String','frequency');
        
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
              
        % Make figure visble after adding all components
        f.Visible = 'on';

    end

    function start_cb(source,callbackdata)
        
        th.TimerFcn={@model_first_order,p,l_in,l_out};
        th.StopFcn={@model_stop};
        set(th,...
            'period',p.dt,...
            'TasksToExecute', 150*10,...
            'executionmode','fixedrate');
        start(th);
        
    end
    
    function update_model() 
        
             %recalculate after params have been changed
        p.tau=p.m/p.c;               %time constant

%         ah=axes('xlim',[-1,2*1/p.w],'ylim',[-15,15]);
        p.wn=sqrt(p.k/p.m);
        p.dr=p.c/(2*sqrt(p.m*p.k));
        p.r=p.w/p.wn;
        
        p.M=1/sqrt((1-p.r^2)^2+(2*p.dr*p.r)^2); %amplitude ratio 
        p.phi=atan(2*p.dr*p.r/(1-p.r^2));  

        str=sprintf('A : %6.2f\n\nw : %6.2f\n\nm : %6.2f\n\nc : %6.2f\n\nk : %6.2f\n\n',p.A,p.w,p.m,p.c,p.k);
        txt = uicontrol('Style','text',...
            'FontSize',fsize,...
            'Position',[175 sld_y 100 200],...
            'String',str);
        str=sprintf('M : %6.2f\nphi : %6.2f\nwn : %6.2f\ndr : %6.2f\n',p.M,p.phi,p.wn,p.dr);
        txt = uicontrol('Style','text',...
            'FontSize',fsize,...
            'Position',[100 sld_y-150 100 120],...
            'String',str);
        th.TimerFcn={@model_first_order,p,l_in,l_out};%update the graph in motion (need transients to work)
        
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