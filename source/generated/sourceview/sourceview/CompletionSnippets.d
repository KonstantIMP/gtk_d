module sourceview.CompletionSnippets;

private import glib.ConstructionException;
private import gobject.ObjectG;
private import sourceview.CompletionProviderIF;
private import sourceview.CompletionProviderT;
private import sourceview.c.functions;
public  import sourceview.c.types;


/** */
public class CompletionSnippets : ObjectG, CompletionProviderIF
{
	/** the main Gtk struct */
	protected GtkSourceCompletionSnippets* gtkSourceCompletionSnippets;

	/** Get the main Gtk struct */
	public GtkSourceCompletionSnippets* getCompletionSnippetsStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceCompletionSnippets;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceCompletionSnippets;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceCompletionSnippets* gtkSourceCompletionSnippets, bool ownedRef = false)
	{
		this.gtkSourceCompletionSnippets = gtkSourceCompletionSnippets;
		super(cast(GObject*)gtkSourceCompletionSnippets, ownedRef);
	}

	// add the CompletionProvider capabilities
	mixin CompletionProviderT!(GtkSourceCompletionSnippets);


	/** */
	public static GType getType()
	{
		return gtk_source_completion_snippets_get_type();
	}

	/** */
	public this()
	{
		auto __p = gtk_source_completion_snippets_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceCompletionSnippets*) __p, true);
	}
}
