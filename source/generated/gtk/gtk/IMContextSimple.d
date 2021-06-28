module gtk.IMContextSimple;

private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;
private import gtk.IMContext;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkIMContextSimple` is an input method supporting table-based input methods.
 * 
 * `GtkIMContextSimple` has a built-in table of compose sequences that is
 * derived from the X11 Compose files.
 * 
 * `GtkIMContextSimple` reads additional compose sequences from the first of the
 * following files that is found: ~/.config/gtk-4.0/Compose, ~/.XCompose,
 * /usr/share/X11/locale/$locale/Compose (for locales that have a nontrivial
 * Compose file). The syntax of these files is described in the Compose(5)
 * manual page.
 * 
 * ## Unicode characters
 * 
 * `GtkIMContextSimple` also supports numeric entry of Unicode characters
 * by typing <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>u</kbd>, followed by a
 * hexadecimal Unicode codepoint.
 * 
 * For example,
 * 
 * Ctrl-Shift-u 1 2 3 Enter
 * 
 * yields U+0123 LATIN SMALL LETTER G WITH CEDILLA, i.e. ģ.
 */
public class IMContextSimple : IMContext
{
	/** the main Gtk struct */
	protected GtkIMContextSimple* gtkIMContextSimple;

	/** Get the main Gtk struct */
	public GtkIMContextSimple* getIMContextSimpleStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkIMContextSimple;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkIMContextSimple;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkIMContextSimple* gtkIMContextSimple, bool ownedRef = false)
	{
		this.gtkIMContextSimple = gtkIMContextSimple;
		super(cast(GtkIMContext*)gtkIMContextSimple, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_im_context_simple_get_type();
	}

	/**
	 * Creates a new #GtkIMContextSimple.
	 *
	 * Returns: a new #GtkIMContextSimple.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this()
	{
		auto __p = gtk_im_context_simple_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkIMContextSimple*) __p, true);
	}

	/**
	 * Adds an additional table from the X11 compose file.
	 *
	 * Params:
	 *     composeFile = The path of compose file
	 */
	public void addComposeFile(string composeFile)
	{
		gtk_im_context_simple_add_compose_file(gtkIMContextSimple, Str.toStringz(composeFile));
	}

	/**
	 * Adds an additional table to search to the input context.
	 * Each row of the table consists of @max_seq_len key symbols
	 * followed by two #guint16 interpreted as the high and low
	 * words of a #gunicode value. Tables are searched starting
	 * from the last added.
	 *
	 * The table must be sorted in dictionary order on the
	 * numeric value of the key symbol fields. (Values beyond
	 * the length of the sequence should be zero.)
	 *
	 * Params:
	 *     data = the table
	 *     maxSeqLen = Maximum length of a sequence in the table
	 *     nSeqs = number of sequences in the table
	 */
	public void addTable(ushort[] data, int maxSeqLen, int nSeqs)
	{
		gtk_im_context_simple_add_table(gtkIMContextSimple, data.ptr, maxSeqLen, nSeqs);
	}
}
