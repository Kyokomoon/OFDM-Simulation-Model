function [ofdm, Nz, prefix, N_qpsk,OP_ind,INF_ind,OP_sig] = ofdm_modulation(qpsk_sequence, DRS, pref)
    N_qpsk = length(qpsk_sequence);
    N_rs = floor(N_qpsk / DRS);
    OP_sig = [];
    for i=1:N_rs
        OP_sig(i) = 0.707 + 0.707i;
    end

    pilot = 0.707 + 0.707i;
    
    OP_ind = 1:DRS:N_qpsk+DRS-1;
    for i = 1:DRS:N_qpsk+DRS-1
         newSequenceIndex = min(i, N_qpsk); % Определяем массив данных
         qpsk_sequence = [qpsk_sequence(1:newSequenceIndex) pilot qpsk_sequence(newSequenceIndex+1:end)];
    end
   
    arr = 1:N_qpsk+ N_rs;
    INF_ind = setdiff(arr, OP_ind);
    C= 1/4;
    Nz = round(C*(N_rs+N_qpsk));
    zero_defend = [zeros(1, Nz), qpsk_sequence, zeros(1, Nz)];
    ifft_ofdm = ifft(zero_defend);
    prefix = pref * length(ifft_ofdm);
    %переносим префикс
    ofdm = [ifft_ofdm(length(ifft_ofdm)-prefix: length(ifft_ofdm)),      ifft_ofdm];
end