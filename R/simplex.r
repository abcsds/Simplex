simplex <- function(C, A, b){
    if (!is.null(A)) 
        if (is.matrix(A)) 
            m <- nrow(A)
        else m <- 1
    else m <- 0 # error

    n <- length(C)
    print(c(n,m))
    # dimnames(dimentions) <- list("row", c("m", "n"))
    # colnames(dimentions) <- c('m', 'n')
    # print(dimentions[m])
    # return(list(x,z))
}


# simplex <- function (a, A1 = NULL, b1 = NULL, A2 = NULL, b2 = NULL, A3 = NULL, 
#     b3 = NULL, maxi = FALSE, n.iter = n + 2 * m, eps = 1e-10) 
# {
#     call <- match.call()
#     if (!is.null(A1)) 
#         if (is.matrix(A1)) 
#             m1 <- nrow(A1)
#         else m1 <- 1
#     else m1 <- 0
#     if (!is.null(A2)) 
#         if (is.matrix(A2)) 
#             m2 <- nrow(A2)
#         else m2 <- 1
#     else m2 <- 0
#     if (!is.null(A3)) 
#         if (is.matrix(A3)) 
#             m3 <- nrow(A3)
#         else m3 <- 1
#     else m3 <- 0
#     m <- m1 + m2 + m3
#     n <- length(a)
#     a.o <- a
#     if (maxi) 
#         a <- -a
#     if (m2 + m3 == 0) 
#         out <- simplex1(c(a, rep(0, m1)), cbind(A1, iden(m1)), 
#             b1, c(rep(0, m1), b1), n + (1L:m1), eps = eps)
#     else {
#         if (m2 > 0) 
#             out1 <- simplex1(c(a, rep(0, m1 + 2 * m2 + m3)), 
#                 cbind(rbind(A1, A2, A3), rbind(iden(m1), zero(m2 + 
#                   m3, m1)), rbind(zero(m1, m2), -iden(m2), zero(m3, 
#                   m2)), rbind(zero(m1, m2 + m3), iden(m2 + m3))), 
#                 c(b1, b2, b3), c(rep(0, n), b1, rep(0, m2), b2, 
#                   b3), c(n + (1L:m1), (n + m1 + m2) + (1L:(m2 + 
#                   m3))), stage = 1, n1 = n + m1 + m2, n.iter = n.iter, 
#                 eps = eps)
#         else out1 <- simplex1(c(a, rep(0, m1 + m3)), cbind(rbind(A1, 
#             A3), iden(m1 + m3)), c(b1, b3), c(rep(0, n), b1, 
#             b3), n + (1L:(m1 + m3)), stage = 1, n1 = n + m1, 
#             n.iter = n.iter, eps = eps)
#         if (out1$val.aux > eps) 
#             out <- out1
#         else out <- simplex1(out1$a[1L:(n + m1 + m2)], out1$A[, 
#             1L:(n + m1 + m2)], out1$soln[out1$basic], out1$soln[1L:(n + 
#             m1 + m2)], out1$basic, val = out1$value, n.iter = n.iter, 
#             eps = eps)
#     }
#     if (maxi) 
#         out$value <- -out$value
#     out$maxi <- maxi
#     if (m1 > 0L) 
#         out$slack <- out$soln[n + (1L:m1)]
#     if (m2 > 0L) 
#         out$surplus <- out$soln[n + m1 + (1L:m2)]
#     if (out$solved == -1) 
#         out$artificial <- out$soln[-(1L:n + m1 + m2)]
#     out$obj <- a.o
#     names(out$obj) <- paste("x", seq_len(n), sep = "")
#     out$soln <- out$soln[seq_len(n)]
#     names(out$soln) <- paste("x", seq_len(n), sep = "")
#     out$call <- call
#     class(out) <- "simplex"
#     out
# }
