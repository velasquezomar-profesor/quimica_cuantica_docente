# ============================================
# Partícula en un anillo
# Fisicoquímica III
# ============================================

# Variables simbólicas
var('theta m R hbar')

# Parámetros físicos (pueden modificarse)
hbar = 1        # Usamos unidades reducidas
R = 1           # Radio del anillo
m_val = 1       # Número cuántico m

# Función de onda normalizada
psi = (1/sqrt(2*pi))*exp(I*m_val*theta)

# Parte real, imaginaria y densidad de probabilidad
psi_real = real(psi)
psi_imag = imag(psi)
psi_prob = abs(psi)^2

# ============================================
# Gráficas
# ============================================

p1 = plot(psi_real, (theta, 0, 2*pi),
          legend_label="Re(ψ)",
          color='blue')

p2 = plot(psi_imag, (theta, 0, 2*pi),
          legend_label="Im(ψ)",
          color='red')

p3 = plot(psi_prob, (theta, 0, 2*pi),
          legend_label="|ψ|²",
          color='black',
          thickness=2)

show(p1 + p2 + p3)

# ============================================
# Operador de momento angular Lz
# ============================================

Lz_operator = -I*hbar*diff(psi, theta)

# Verificación de autovalor
simplify(Lz_operator / psi)

# ============================================
# Valor esperado de Lz
# ============================================

Lz_expect = integral(conjugate(psi)*(-I*hbar*diff(psi, theta)),
                      theta, 0, 2*pi)

simplify(Lz_expect)

# ============================================
# Energía del sistema
# ============================================

I_moment = m_val^2 * hbar^2 / (2 * R^2)
E_m = I_moment

m_val*hbar

m_val^2 / (2*R^2)
E_m
