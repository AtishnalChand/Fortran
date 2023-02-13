program read_csv
  implicit none

  integer :: i, nrows
  character (len=100) :: line
  character (len=20) :: header(100), data(100)
  real :: rdata(100)

  open(unit=10, file="reaction_rates.csv", status="old", action="read")

  nrows = 0

  do
     read(10, '(A)', end=99) line
     nrows = nrows + 1
     read(line, '(A20,A)', advance='no') header(nrows), line
     read(line, '(F20.10)', advance='no') rdata(nrows)
  end do

  99 continue
  close(10)

  ! Print header and data values
  do i = 1, nrows
     print*, header(i), rdata(i)
  end do

end program read_csv