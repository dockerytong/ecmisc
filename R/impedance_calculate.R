#' calulate impedance from CA experiment
#'
#' @param ca_data CA experimental data for calculate
#' @param Amplitude Amplitude used in CA, in unit of Voltage
#' @param ratio ratio for high frequency data cutoff
#'
#' @return
#' @export
#'
#' @examples
#'
impedance_calculate <- function(ca_data, Amplitude = 0.01, ratio = 10)
{
  fs = 1 / ca_data[[1, 1]] # 采样率
  first_line <- data.table(V1 = c(0), V2 = c(0)) # 填充初始值
  ca_data <- rbind(first_line, ca_data)
  # 计算阻抗
  ca_data %>%
    # 电流数据差分
    .[,.(Current = diff(V2))] %>%
    # 计算每个点的频率和复阻抗
    .[,.(Freq = ((1:length(Current))-1)*c(rep(fs,fs+1))/length(Current), FFT = Amplitude/(fft(Current)))] %>%
    # 计算可能画图可能需要的参数
    .[,.(Freq, Re = Re(FFT), Im = Im(FFT), Mod = Mod(FFT), Phase = Arg(FFT))] %>%
    # 去掉部分高频噪声数据（需要进一步的代码对高频数据进行平滑）
    .[Freq > 1 & Freq < fs[[1]]/ratio] -> impedance
  # 输出阻抗数据
  return(impedance)
}
