%DataVisu;
% Scipt DataVisu to be called or copy & past within the picgui script 
Tserial = 0.001;
if ~ishandle(50) figure(50); end % new fig
set(0,'CurrentFigure',50);  % select fig
[A, tUart] = picgui.padr(Rn,10,t_Rn);  % sample on last column data received (remove NaN numbers from the original matrix)
  
if ~isempty(A)
    clf 
    t = ([0:(length(A)-1)]  + tUart(1))*Tserial; % Do not rely on UART data arrival timestamp. Recreate time vector
    subplot(3,1,1); plot(t,A(:,1:2)); axis tight; ylabel('v_d, v_q'); ylim([-12 12]);    
    subplot(3,1,2); plot(t,A(:,3:4)); axis tight; ylabel('i_d (in A)'); ylim([-4 4]);
    subplot(3,1,3); plot(t,A(:,5:6)); axis tight; ylabel('\omega, \omega_{ref} (in rad/s)'); ylim([50 250]);
    xlabel('time (in s)')

    dim=[0 .9 .1 .1] ;
    if(A(end,11)==0)
    annotation('textbox',dim,'String',sprintf('Mode = Off'));
    elseif(A(end,11)==1)
    annotation('textbox',dim,'String',sprintf('Mode = Speed'));
    end

    dim=[0.25 .9 .1 .1] ;
    str = 'alpha = %.2f';
    annotation('textbox',dim,'String',sprintf(str,A(end,10)));
    dim=[0.5 .9 .1 .1] ;
    str = 'K = [%.2f   %.2f   %.2f]';
    annotation('textbox',dim,'String',sprintf(str,A(end,7:9)));
    


end
 
