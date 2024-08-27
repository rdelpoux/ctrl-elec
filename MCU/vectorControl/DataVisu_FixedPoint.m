%DataVisu;
% Scipt DataVisu to be called or copy & past within the picgui script 
Tserial = 5e-4;
if ~ishandle(50) figure(50); end % new fig
set(0,'CurrentFigure',50);  % select fig
[A, tUart] = picgui.padr(Rn,7,t_Rn);  % sample on last column data received (remove NaN numbers from the original matrix)
% considere signed values (all channels)
idx = find(A > 65535 / 2);
A(idx)= A(idx)-65536;
    
if ~isempty(A)
    clf 
    t = ([0:(length(A)-1)]  + tUart(1))*Tserial; % Do not rely on UART data arrival timestamp. Recreate time vector
    subplot(3,1,1); plot(t,A(:,2:3)*3.3/65536*21*2/sqrt(3)); axis tight; ylabel('v_d_q (in V)'); ylim([-20 20]);    
    subplot(3,1,2); plot(t,A(:,4:5)*21.83/32768); axis tight; ylabel('i_d_q (in A)'); ylim([-10 10]);
    subplot(3,1,3); plot(t,[A(:,6:7)]); axis tight; ylabel('om, omr (in rpm)'); ylim([0 6000]);
    xlabel('time (in s)')


    dim=[0 .9 .1 .1] ;
    if(A(end,1)==0)
    annotation('textbox',dim,'String',sprintf('Mode = BO'));
    elseif(A(end,1)==1)
    annotation('textbox',dim,'String',sprintf('Mode = Speed'));
    elseif(A(end,1)==2)
    annotation('textbox',dim,'String',sprintf('Mode = Speed step'));
    end
   

    dim=[0.25 .9 .1 .1] ;
    str = 'vDC = %.2f V';
    annotation('textbox',dim,'String',sprintf(str,A(end,9)*3.3/65536*21));
    dim=[0.5 .9 .1 .1] ;
    str = 'vMAX = %.2f V';
    annotation('textbox',dim,'String',sprintf(str,A(end,8)*3.3/65536*21*2/sqrt(3)));
    dim=[0.75 .9 .1 .1] ;
    str = 'CPU = %.2f %%';
    annotation('textbox',dim,'String',sprintf(str,A(end,10)*2^-8));
end
 