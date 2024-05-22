function sim2mat()
% Convert Picgui log files from into input file to feed simulink model
% Picgui log files are raw UART output stream sent to the PC by the model executed on the board.
% the binary file (with txt extension) is then decoded and stored into a mat file with the picgui "load" button.
% This script takes the resulting .mat file.
%
% The script convert input files into simulink format with a discrete time resolution depending on data send through the UART.
% Under-sampled sensors are padded with a zero-order hold filter (i.e. stairs)


% Select fil to be converted 
[file]=uigetfile('*.mat','select a file starting with year');

prompt = {'Enter sampling time (in s):','Enter last faster signal:'};
dlgtitle = 'Input';
dims = [1 35];
%definput = {'5e-4','6'};
%answer = inputdlg(prompt,dlgtitle,dims,definput)
Ts =  50e-6;%str2num(answer{1})
trig = 6; %str2num(answer{2})

% output files with have same name preceded with 'Sim_'.
% conversion not done if output file already exist (save time)
%%
Flag = 0
    FileIn = [file '.mat'];
    FileOut = ['Sim_' file '.mat'];
    if ~exist(FileOut,'file')        
        Flag = 1;
        disp(['Load ' file ]);
        load(file);
    
        A = picgui.padr(Rtotal,trig); % trig on 2nd column all data are rewriten at 50us rate. 3rd column is sampled and hold.
        t = 0:Ts:((length(A)-1)*Ts);    % time vector for sim reference
        SimIn = [t ; A'];   % simulink file input format: first line is time, others lines are values

        disp(['  Save Sim_' file '.mat']);
        save(['Sim_' file],'SimIn');
    end


if Flag == 0
    disp('sim2mat conversion: Nothing to do');
end




