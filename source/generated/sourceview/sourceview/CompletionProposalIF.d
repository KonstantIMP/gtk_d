module sourceview.CompletionProposalIF;

private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public interface CompletionProposalIF{
	/** Get the main Gtk struct */
	public GtkSourceCompletionProposal* getCompletionProposalStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_source_completion_proposal_get_type();
	}
}
