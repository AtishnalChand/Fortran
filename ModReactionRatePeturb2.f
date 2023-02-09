! Declare the module for reaction rate perturbation
module ModReactionRatePerturb
  implicit none

 ! Declare variables to store the respective reaction rates
  real :: A1, A2, A3, A4, A5, A6

! Declare a subroutine to read the csv data file
  contains
    subroutine read_csvfile()
         implicit none
         integer, parameter :: n = 1
         integer :: i, ierror

        ! Open the file "data.csv"
         open(10, file = "data.csv", status = 'old', Iostat = ierror)
         
         ! Check if there was an error opening the csv file
         if (ierror /= 0) Then
           print*, "Error opening file data.csv"
            stop
         end if
         
         ! Read a null line from the file ( reads and ignores the  header line)
            read(10, '()', Iostat = ierror)
         
         ! Check if there was an error reading the header line
          if (ierror /= 0) Then
             print*, "Error reading header line from file data.csv"
             stop
          end if

         do i = 1, n
            ! Read the data from the file
            read (10, *, Iostat = ierror) A1, A2, A3, A4, A5, A6
           
         ! Check if there was an error reading the data
         if (ierror /= 0) then
            print*, "Error reading data from file data.csv"
           stop
         end if
           
          ! Print the reaction rates to confirm if values were successfully read and stored in the respective variable
             print*, A1, A2, A3, A4, A5, A6
         end do

         close(10)
    
    end subroutine read_csvfile
    
end module ModReactionRatePerturb

! Declare a main program to use the reaction rate module
program Main
  use ModRelectionRatePerturb
  implicit none

  ! Call the subroutine to read the file
  call read_csvfile()

end program Main



    
    
    
