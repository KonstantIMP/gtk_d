module sourceview.CompletionProposalT;

public  import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public template CompletionProposalT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkSourceCompletionProposal* getCompletionProposalStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkSourceCompletionProposal*)getStruct();
	}

}
