module gio.ConverterOutputStream;

private import gio.ConverterIF;
private import gio.FilterOutputStream;
private import gio.OutputStream;
private import gio.PollableOutputStreamIF;
private import gio.PollableOutputStreamT;
private import gio.c.functions;
public  import gio.c.types;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * Converter output stream implements #GOutputStream and allows
 * conversion of data of various types during reading.
 * 
 * As of GLib 2.34, #GConverterOutputStream implements
 * #GPollableOutputStream.
 */
public class ConverterOutputStream : FilterOutputStream, PollableOutputStreamIF
{
	/** the main Gtk struct */
	protected GConverterOutputStream* gConverterOutputStream;

	/** Get the main Gtk struct */
	public GConverterOutputStream* getConverterOutputStreamStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gConverterOutputStream;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gConverterOutputStream;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GConverterOutputStream* gConverterOutputStream, bool ownedRef = false)
	{
		this.gConverterOutputStream = gConverterOutputStream;
		super(cast(GFilterOutputStream*)gConverterOutputStream, ownedRef);
	}

	// add the PollableOutputStream capabilities
	mixin PollableOutputStreamT!(GConverterOutputStream);


	/** */
	public static GType getType()
	{
		return g_converter_output_stream_get_type();
	}

	/**
	 * Creates a new converter output stream for the @base_stream.
	 *
	 * Params:
	 *     baseStream = a #GOutputStream
	 *     converter = a #GConverter
	 *
	 * Returns: a new #GOutputStream.
	 *
	 * Throws: ConstructionException GTK+ fails to create the object.
	 */
	public this(OutputStream baseStream, ConverterIF converter)
	{
		auto __p = g_converter_output_stream_new((baseStream is null) ? null : baseStream.getOutputStreamStruct(), (converter is null) ? null : converter.getConverterStruct());

		if(__p is null)
		{
			throw new ConstructionException("null returned by new");
		}

		this(cast(GConverterOutputStream*) __p, true);
	}

	/**
	 * Gets the #GConverter that is used by @converter_stream.
	 *
	 * Returns: the converter of the converter output stream
	 *
	 * Since: 2.24
	 */
	public ConverterIF getConverter()
	{
		auto __p = g_converter_output_stream_get_converter(gConverterOutputStream);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(ConverterIF)(cast(GConverter*) __p);
	}
}
