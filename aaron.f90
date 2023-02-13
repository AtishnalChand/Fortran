! Declare the module for reaction rate perturbation
module ModReactionRatePerturb
  implicit none

  integer :: nRatesMax = 2000
  
 ! Declare variables to store the respective reaction rates
  real :: A1, A2, A3, A4, A5, A6
  real (dimension = nRatesMax) :: PerturbedRates
  character (len=20, dimension= nRatesMax) :: Reactions
  
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

     subroutine get_reaction_rate(reaction, rate)
       character (len = 20), intent(in) :: reaction
       character (len = 20) :: tempstring
       real, intent(out) :: rate
       logical :: IsFound = .false.

       ! Compare the input string to the read in strings one-by-one
       do i=1, nPerturbedRates
          ! if they match, then set the rate
          ! (figure out how to compare strings in fortran!!!):
          tempstring = Reactions(i)
          if (reaction == tempstring) then
             rate = PerturbedRates(i)
             IsFound = .true.
             exit
          endif
       enddo

       if (.not.IsFound) then
          rate = -1e32
          write(*,*) "I could not find reation rate : ", reaction
       endif
       
     end subroutine get_reaction_rate
     
end module ModReactionRatePerturb

! Declare a main program to use the reaction rate module
program Main
  use ModReactionRatePerturb
  implicit none

  ! Call the subroutine to read the file
  call get_reaction_rate(A3, rate)
  
! Print the reaction rates to confirm if values were successfully read and stored in the respective variable
               print*, A3
  
end program Main



    
    
    
