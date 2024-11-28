%DataVisu;
% Scipt DataVisu to be called or copy & past within the picgui script 
Tserial = 1e-3;
Data = 6;
if ~ishandle(50) figure(50); end % new fig
set(0,'CurrentFigure',50);  % select fig
[A, tUart] = picgui.padr(Rn,6,t_Rn);  % sample on last column data received (remove NaN numbers from the original matrix)
% considere signed values (all channels)
idx = find(A > 65535 / 2);
A(idx)= A(idx)-65536;
    
if ~isempty(A)
    clf 
    t = ([0:(length(A)-1)]  + tUart(1))*Tserial; % Do not rely on UART data arrival timestamp. Recreate time vector
    subplot(4,1,1); plot(t,A(:,1:2)); axis tight; ylabel('sincos'); 
    subplot(4,1,2); plot(t,A(:,3)); axis tight; ylabel('om (rad/s)'); 
    subplot(4,1,3); plot(t,[A(:,4:5)]); axis tight; ylabel('iab (A)');
    subplot(4,1,4); plot(t,[A(:,6)]); axis tight; ylabel('pot'); 
    xlabel('time (in s)')
end
 