module gio.FilterOutputStream;

private import gio.OutputStream;
private import gio.c.functions;
public  import gio.c.types;
private import gobject.ObjectG;


/**
 * Base class for output stream implementations that perform some
 * kind of filtering operation on a base stream. Typical examples
 * of filtering operations are character set conversion, compression
 * and byte order flipping.
 */
public class FilterOutputStream : OutputStream
{
	/** the main Gtk struct */
	protected GFilterOutputStream* gFilterOutputStream;

	/** Get the main Gtk struct */
	public GFilterOutputStream* getFilterOutputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gFilterOutputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFilterOutputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFilterOutputStream* gFilterOutputStream, bool ownedRef = false)
	{
		this.gFilterOutputStream = gFilterOutputStream;
		super(cast(GOutputStream*)gFilterOutputStream, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_filter_output_stream_get_type();
	}

	/**
	 * Gets the base stream for the filter stream.
	 *
	 * Returns: a #GOutputStream.
	 */
	public OutputStream getBaseStream()
	{
		auto __p = g_filter_output_stream_get_base_stream(gFilterOutputStream);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(OutputStream)(cast(GOutputStream*) __p);
	}

	/**
	 * Returns whether the base stream will be closed when @stream is
	 * closed.
	 *
	 * Returns: %TRUE if the base stream will be closed.
	 */
	public bool getCloseBaseStream()
	{
		return g_filter_output_stream_get_close_base_stream(gFilterOutputStream) != 0;
	}

	/**
	 * Sets whether the base stream will be closed when @stream is closed.
	 *
	 * Params:
	 *     closeBase = %TRUE to close the base stream.
	 */
	public void setCloseBaseStream(bool closeBase)
	{
		g_filter_output_stream_set_close_base_stream(gFilterOutputStream, closeBase);
	}
}
