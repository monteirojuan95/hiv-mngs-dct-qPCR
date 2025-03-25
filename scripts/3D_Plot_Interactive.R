library(rgl)
library(grDevices)

# Seus vetores de dados
log_viral_load <- c(4.956457, 5.59855, 3.285557, 2.602059991, 4.574956776, 3.42975228,
                    3.699837726, 5.40014064, 2.602059991, 4.598571663, 4.524655712,
                    4.155032229, 4.894371454, 4.220108088, 4.278067331, 2.602059991,
                    4.602168551, 5.311414767, 3.536558443, 3.811575006, 2.763427994,
                    5.097361445, 3.369215857, 5.503668138, 3.894869657, 4.086003706,
                    3.944975908, 3.894869657, 3.618048097, 4.761251074, 3.44870632,
                    4.909181476, 4.049992857, 3.462397998, 4.07809415, 4.234770295,
                    3.896526217, 4.731266349)

log_paired_end_reads <- c(3.649140064144219, 4.19534605834842, 2.3324384599156054, 0.7781512503836436,
                          0.7781512503836436, 3.3529539117100877, 3.2676409823459154, 4.256765837941647,
                          1.3010299956639813, 3.449169732165201, 3.3089910290001643, 3.34966598409663,
                          3.8101652845431495, 2.9036325160842376, 3.15106325335375, 0.0,
                          4.003029470553618, 4.620531634720476, 2.6954816764901977, 3.0802656273398448,
                          2.92272545799326, 4.283934113456609, 2.6884198220027105, 4.4496018045961385,
                          3.0115704435972783, 3.0979510709941502, 3.3958503760187813, 3.0195316845312554,
                          3.307923703611882, 3.6488477083728936, 2.0569048513364727, 3.7101173651118162,
                          2.829946695941636, 1.3010299956639813, 3.0969100130080562, 2.957128197676813,
                          2.745855195173729, 3.725176301419137)

delta_ct_values_15 <- c(4.521372, 4.899314, 12.020923, 12.679848, 6.142715, 6.684905, 10.931518,
                        3.112589, 11.882727, 7.324425, 7.807858, 4.371355, 4.742676, 8.434841,
                        6.955236, 12.643919, 5.121775, 3.265357, 8.616819, 7.865803, 9.389228,
                        4.395952, 9.35585, 3.827848, 9.855807, 9.823443, 12.232013, 7.743931,
                        6.929769, 4.826322, 9.631996, 5.302231, 7.831221, 5.455967, 6.993347,
                        8.157394, 8.80468, 5.654474)

# Definir uma paleta de cores gradiente
palette <- colorRampPalette(c("#67a9cf", "#b2182b"))
colors <- palette(length(delta_ct_values_15))

# Ajustar um modelo linear
fit <- lm(log_viral_load ~ delta_ct_values_15 + log_paired_end_reads)

# Usando rgl para plotagem 3D interativa
open3d()
plot3d(delta_ct_values_15, log_paired_end_reads, log_viral_load, col = colors, type = "s", radius = 0.21,
       xlab = "", ylab = "", zlab = "", lit = FALSE)

# Adicionar rótulos de eixo manualmente com distância ajustada
mtext3d("delta CT", edge = "x", line = 3)
mtext3d("Log paired-end reads", edge = "y", line = 3)
mtext3d("Log viral load", edge = "z", line = 3)

# Ajustar a escala dos eixos para transformar o cubo em um paralelepípedo
aspect3d(2, 1, 1)

# Adicionar o grid de regressão na plotagem interativa
grid_lines <- 20 # Reduzindo o número de linhas no grid para aumentar o tamanho dos quadrados
x_pred <- seq(min(delta_ct_values_15), max(delta_ct_values_15), length.out = grid_lines)
y_pred <- seq(min(log_paired_end_reads), max(log_paired_end_reads), length.out = grid_lines)
z_pred <- outer(x_pred, y_pred, function(x, y) coef_fit["(Intercept)"] + coef_fit["delta_ct_values_15"] * x + coef_fit["log_paired_end_reads"] * y)

surface3d(x_pred, y_pred, z_pred, color = "lightgrey", alpha = 0.5, front = "lines")