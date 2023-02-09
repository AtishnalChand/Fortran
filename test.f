program read_csv
   implicit none

   character(len=50) :: header(6)
   real :: data(6)
   integer :: i

   open(unit=10, file="data.csv", status="old", action="read")

   read(10, *) header
   read(10, *) data

   do i = 1, 6
      write(*,'(a,f6.2)') header(i), data(i)
   end do

   close(10)
end program read_csv
