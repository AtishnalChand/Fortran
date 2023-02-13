      program readcsv
         implicit none
         integer, parameter :: n =1
         real :: A1, A2, A3, A4, A5, A6
         integer :: i


         open(10, file = "random_samples.csv", status = 'old')
         read(10, '()')

         do i = 1,n
           read (10, *) A1, A2, A3, A4, A5, A6
           print*, A1, A2, A3, A4, A5, A6
         end do

         close(10)
      end program readcsv
