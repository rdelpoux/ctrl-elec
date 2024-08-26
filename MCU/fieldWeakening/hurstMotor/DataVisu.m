
%DataVisu;
% Scipt DataVisu to be called or copy & past within the picgui script 
Tserial = 0.0005;



if ~ishandle(49) figure(49); end % new fig
set(0,'CurrentFigure',49);  % select fig
[A, tUart] = picgui.padr(Rn,10,t_Rn);  % sample on last column data received (remove NaN numbers from the original matrix)
% considere signed values (all channels)
idx = find(A > 65535 / 2);
A(idx)= A(idx)-65536;
    
if ~isempty(A)
    clf 
    t = ([0:(length(A)-1)]  + tUart(1))*Tserial; % Do not rely on UART data arrival timestamp. Recreate time vector
    subplot(3,1,1); plot(t,[0.0012*A(:,2:3) sqrt((0.0012*A(:,2)).^2+(0.0012*A(:,3)).^2)]); axis tight; ylabel('v_d v_q norm  [V]'); ylim([-20 20]);    
    subplot(3,1,2); plot(t,21.83/32768*A(:,[4 5])); axis tight; ylabel('ird irq [A])'); ylim([-5 1]);
    hold on;  plot(t,2^-11*A(:,[7 8])); axis tight; ylabel('id iq  [A]'); 
    hold off  ; ylim([-8 8])
    subplot(3,1,3); plot(t,[A(:,9:10)]); axis tight; ylabel('om, omr [rad/s])');  ylim([0 500]);

    xlabel('time (in s)')
    dim=[0 .9 .1 .1] ;
    if(A(end,1)==0)
    annotation('textbox',dim,'String',sprintf('Mode = BO'));
    elseif(A(end,1)==1)
    annotation('textbox',dim,'String',sprintf('Mode = Speed'));
    end
    dim=[0.5 .9 .1 .1] ;
    %annotation('textbox',dim,'String',sprintf('vMax = %f',2^-11*A(end,3)));
end


%%% the saturation circles 
%%% Parameters of the Hurst
model.R = 0.405;         % Ohm
model.L = 0.3e-3;        % H
model.Phif = 7.63e-3;    % Wb
model.p = 5;
model.omMax = 450;       % rad/s
model.vMax = 24/sqrt(3); % V for space vector modulation
model.iMax = 10;         % A
vMax = 24/sqrt(3) ; 
if ~ishandle(51) figure(51); end % new fig

w = median(A([end-100:end],9)); 
%vMax = 24/sqrt(3) ;  %A(end,11);
%model.iMax = 10 ; 
set(0,'CurrentFigure',51);  % select fig
clf
n= 1.1; 
K = @(w) model.p*w*model.Phif/(model.R^2+(model.p*w*model.L)^2);
a = @(w) K(w)*model.p*w*model.L ;
b =  @(w) K(w)*model.R;
c = @(w) vMax^2/(model.R^2+(model.p*w*model.L)^2);
Fi = @(id,iq) ( id.^2 + iq.^2 - model.iMax.^2); %% Current limit 
Fv = @(id,iq) ( (id+a(w)).^2 + (iq+b(w)).^2 - c(w)); %% Voltage limit
hi = fimplicit(Fi,n*[-model.iMax model.iMax 0 model.iMax]); hold on;
hv = fimplicit(Fv,n*[-model.iMax model.iMax 0 model.iMax]);

plot(median(2^-11*A([end-100:end],7)),median(2^-11*A([end-100:end],8)),'*')
xlabel('i_d [A]') ; ylabel('i_q [A]')
if ~isempty(A)

end
 