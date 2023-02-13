program main
  implicit none

  character (len = 20) :: reaction
  real :: rate
  integer :: nPerturbedRates

  ! Hardcode the number of reactions
  nPerturbedRates = 3

  ! Open the reaction data file
  open (unit = 10, file = "reaction_data.csv", status = "old")

  ! Allocate arrays for reactions and rates
  allocate (Reactions(nPerturbedRates), PerturbedRates(nPerturbedRates))

  ! Read the reactions and rates from the file
  do i = 1, nPerturbedRates
     read (10, *) Reactions(i), PerturbedRates(i)
  enddo

  ! Close the file
  close (10)

  ! Call the get_reaction_rate subroutine for a specific reaction
  reaction = "Reaction 1"
  call get_reaction_rate(reaction, rate)

  ! Print the reaction rate
  write (*,*) "Reaction rate for ", reaction, " is ", rate

  ! Deallocate the arrays
  deallocate (Reactions, PerturbedRates)

end program main

subroutine get_reaction_rate(reaction, rate)
   character (len = 20), intent(in) :: reaction
   character (len = 20) :: tempstring
   real, intent(out) :: rate
   logical :: IsFound = .false.
   integer :: i

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
