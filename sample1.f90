module read_csv_file

  implicit none

  character (len = 20), dimension (3) :: letters
  real, dimension (3) :: data

  contains

  subroutine read_csv(filename)
    character (len = *), intent(in) :: filename
    integer :: ios, i

    open (unit=10, file=data.csv, status='old', action='read')

    do i=1, 3
      read (10, '(a, f)', iostat=ios) letters(i), data(i)
    enddo
    
    write (10,*) "Letters: ", letters(i)
    write (10,*) "Data: ", data(i)

    close (10)
  end subroutine read_csv

end module read_csv_file
