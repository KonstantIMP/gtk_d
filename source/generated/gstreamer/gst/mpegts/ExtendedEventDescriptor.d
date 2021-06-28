module gst.mpegts.ExtendedEventDescriptor;

private import glib.MemorySlice;
private import glib.PtrArray;
private import glib.Str;
private import glib.c.functions;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/**
 * Extended Event Descriptor (EN 300 468 v.1.13.1)
 */
public final class ExtendedEventDescriptor
{
	/** the main Gtk struct */
	protected GstMpegtsExtendedEventDescriptor* gstMpegtsExtendedEventDescriptor;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsExtendedEventDescriptor* getExtendedEventDescriptorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsExtendedEventDescriptor;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsExtendedEventDescriptor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsExtendedEventDescriptor* gstMpegtsExtendedEventDescriptor, bool ownedRef = false)
	{
		this.gstMpegtsExtendedEventDescriptor = gstMpegtsExtendedEventDescriptor;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			gst_mpegts_extended_event_descriptor_free(gstMpegtsExtendedEventDescriptor);
	}


	/** */
	public @property ubyte descriptorNumber()
	{
		return gstMpegtsExtendedEventDescriptor.descriptorNumber;
	}

	/** Ditto */
	public @property void descriptorNumber(ubyte value)
	{
		gstMpegtsExtendedEventDescriptor.descriptorNumber = value;
	}

	/** */
	public @property ubyte lastDescriptorNumber()
	{
		return gstMpegtsExtendedEventDescriptor.lastDescriptorNumber;
	}

	/** Ditto */
	public @property void lastDescriptorNumber(ubyte value)
	{
		gstMpegtsExtendedEventDescriptor.lastDescriptorNumber = value;
	}

	/**
	 * NULL terminated language code.
	 */
	public @property string languageCode()
	{
		return Str.toString(gstMpegtsExtendedEventDescriptor.languageCode);
	}

	/** Ditto */
	public @property void languageCode(string value)
	{
		gstMpegtsExtendedEventDescriptor.languageCode = Str.toStringz(value);
	}

	/**
	 * the #GstMpegtsExtendedEventItem
	 */
	public @property PtrArray items()
	{
		return new PtrArray(gstMpegtsExtendedEventDescriptor.items, false);
	}

	/** Ditto */
	public @property void items(PtrArray value)
	{
		gstMpegtsExtendedEventDescriptor.items = value.getPtrArrayStruct();
	}

	/** */
	public @property string text()
	{
		return Str.toString(gstMpegtsExtendedEventDescriptor.text);
	}

	/** Ditto */
	public @property void text(string value)
	{
		gstMpegtsExtendedEventDescriptor.text = Str.toStringz(value);
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_extended_event_descriptor_get_type();
	}

	/** */
	public void free()
	{
		gst_mpegts_extended_event_descriptor_free(gstMpegtsExtendedEventDescriptor);
		ownedRef = false;
	}
}
