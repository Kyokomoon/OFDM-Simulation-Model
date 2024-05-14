function signal = ofdm_demodulation(ofdm_ch, Nz, pref, OP_ind, INF_ind, Rtx)
    cut_dem_ch = ofdm_ch(pref:length(ofdm_ch));
    ofdm = fft(cut_dem_ch);
    c = ofdm(Nz:(length(ofdm)-Nz));
    Rrx = [];
    for i=1:length(OP_ind)-1
        Rrx(i) = c(OP_ind(i));
    end
    H = [];
    for i=1:length(Rrx)
        H(i) = Rrx(i)/Rtx(i);
    end
    ts = linspace(1, length(c), length(c));
    OP=[];
    for i=1:length(OP_ind)-1
        OP(i) = OP_ind(i);
    end
    OP_ind = OP;
    Heq = interp1(OP_ind, H, ts,'linear', 'extrap');
    Ceq = c ./ Heq;
    signal = [];
    for i=1:length(INF_ind)
         signal(i) = Ceq(INF_ind(i));
    end
end