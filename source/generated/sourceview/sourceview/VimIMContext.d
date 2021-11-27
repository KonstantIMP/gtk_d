module sourceview.VimIMContext;

private import glib.ConstructionException;
private import glib.Str;
private import glib.c.functions;
private import gobject.ObjectG;
private import gobject.Signals;
private import gtk.IMContext;
private import gtk.TextIter;
private import sourceview.View;
private import sourceview.c.functions;
public  import sourceview.c.types;
private import std.algorithm;


/** */
public class VimIMContext : IMContext
{
	/** the main Gtk struct */
	protected GtkSourceVimIMContext* gtkSourceVimIMContext;

	/** Get the main Gtk struct */
	public GtkSourceVimIMContext* getVimIMContextStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gtkSourceVimIMContext;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gtkSourceVimIMContext;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GtkSourceVimIMContext* gtkSourceVimIMContext, bool ownedRef = false)
	{
		this.gtkSourceVimIMContext = gtkSourceVimIMContext;
		super(cast(GtkIMContext*)gtkSourceVimIMContext, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gtk_source_vim_im_context_get_type();
	}

	/** */
	public this()
	{
		auto __p = gtk_source_vim_im_context_new();

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GtkSourceVimIMContext*) __p, true);
	}

	/**
	 * Executes @command as if it was typed into the command bar by the
	 * user except that this does not emit the
	 * #GtkSourceVimIMContext::execute-command signal.
	 *
	 * Params:
	 *     command = the command text
	 *
	 * Since: 5.4
	 */
	public void executeCommand(string command)
	{
		gtk_source_vim_im_context_execute_command(gtkSourceVimIMContext, Str.toStringz(command));
	}

	/**
	 * Gets the current command-bar text as it is entered by the user.
	 *
	 * Returns: A string containing the command-bar text
	 *
	 * Since: 5.4
	 */
	public string getCommandBarText()
	{
		return Str.toString(gtk_source_vim_im_context_get_command_bar_text(gtkSourceVimIMContext));
	}

	/**
	 * Gets the current command text as it is entered by the user.
	 *
	 * Returns: A string containing the command text
	 *
	 * Since: 5.4
	 */
	public string getCommandText()
	{
		return Str.toString(gtk_source_vim_im_context_get_command_text(gtkSourceVimIMContext));
	}

	/**
	 * Requests the application open the file found at @path. If @path is
	 * %NULL, then the current file should be reloaded from storage.
	 *
	 * This may be executed in relation to the user running the
	 * `:edit` or `:e` commands.
	 *
	 * Params:
	 *     view = the #GtkSourceView
	 *     path = the path if provided, otherwise %NULL
	 *
	 * Since: 5.4
	 */
	gulong addOnEdit(void delegate(View, string, VimIMContext) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "edit", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * The "execute-command" signal is emitted when a command should be
	 * executed. This might be something like ":wq" or ":e &lt;path&gt;".
	 *
	 * If the application chooses to implement this, it should return
	 * %TRUE from this signal to indicate the command has been handled.
	 *
	 * Params:
	 *     command = the command to execute
	 *
	 * Returns: %TRUE if handled; otherwise %FALSE.
	 *
	 * Since: 5.4
	 */
	gulong addOnExecuteCommand(bool delegate(string, VimIMContext) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "execute-command", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Requests that the application format the text between
	 * @begin and @end.
	 *
	 * Params:
	 *     begin = the start location
	 *     end = the end location
	 *
	 * Since: 5.4
	 */
	gulong addOnFormatText(void delegate(TextIter, TextIter, VimIMContext) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "format-text", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}

	/**
	 * Requests the application save the file. If a filename was provided,
	 * it will be available to the signal handler as @path.
	 *
	 * This may be executed in relation to the user running the
	 * `:write` or `:w` commands.
	 *
	 * Params:
	 *     view = the #GtkSourceView
	 *     path = the path if provided, otherwise %NULL
	 *
	 * Since: 5.4
	 */
	gulong addOnWrite(void delegate(View, string, VimIMContext) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		return Signals.connect(this, "write", dlg, connectFlags ^ ConnectFlags.SWAPPED);
	}
}
