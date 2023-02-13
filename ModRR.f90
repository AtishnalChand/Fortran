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

       ! Open the data file
       open(10, file = "reaction_rates.csv", status = 'old', Iostat = ierror)
         
       ! Check if there was an error opening the csv file
       if (ierror /= 0) Then
          print*, "Error opening file reaction_rates.csv"
          stop
       end if
         
       ! Read the data from the file
        do i = 1, nPerturbedRates
             read (10, *, Iostat = ierror) Reaction(i), rates(i)
           
         ! Check if there was an error reading the data
         if (ierror /= 0) then
             print*, "Error reading data from the file reaction_rates.csv"
              stop
          end if
          end do
          close(10)
          
          write (*,*) "Letters: ", Reaction(i), rates(i)
          
     end subroutine read_csvfile  
end module ModReactionRatePerturb





    
    
    
