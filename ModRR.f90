! Declare the module for reaction rate perturbation
module ModReactionRatePerturb
  implicit none
  integer, parameter :: nRatesMax = 2000, nPerturbedRates = 2000
  integer :: i, ierror
  
 ! Declare variables to store the respective reaction rates
  real, dimension(nRatesMax) :: PerturbedRates, rates
  character (len=20), dimension(nRatesMax) :: Reactions
  
! Declare a subroutine to read the csv data file
  contains
    subroutine read_csvfile()
       implicit none
       integer, parameter :: n = 1

       ! Open the file "data.csv"
       open(10, file = "reaction_rates.csv", status = 'old', Iostat = ierror)
         
       ! Check if there was an error opening the csv file
       if (ierror /= 0) Then
          print*, "Error opening file reaction_rates.csv"
          stop
       end if
         
       ! Read a null line from the file ( reads and ignores the  header line)
        read(10, '()', Iostat = ierror)
         
        ! Check if there was an error reading the header line
        if (ierror /= 0) Then
            print*, "Error reading header line from file data.csv"
            stop
        end if
        
       ! Read the data from the file
        do i = 1, n
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
  use ModReactionRatePerturb
  implicit none


  
end program Main



    
    
    
