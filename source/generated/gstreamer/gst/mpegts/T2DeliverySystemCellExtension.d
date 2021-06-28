module gst.mpegts.T2DeliverySystemCellExtension;

private import glib.MemorySlice;
private import gst.mpegts.c.functions;
public  import gst.mpegts.c.types;
private import linker.loader;


/** */
public final class T2DeliverySystemCellExtension
{
	/** the main Gtk struct */
	protected GstMpegtsT2DeliverySystemCellExtension* gstMpegtsT2DeliverySystemCellExtension;
	protected bool ownedRef;

	/** Get the main Gtk struct */
	public GstMpegtsT2DeliverySystemCellExtension* getT2DeliverySystemCellExtensionStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstMpegtsT2DeliverySystemCellExtension;
	}

	/** the main Gtk struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gstMpegtsT2DeliverySystemCellExtension;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstMpegtsT2DeliverySystemCellExtension* gstMpegtsT2DeliverySystemCellExtension, bool ownedRef = false)
	{
		this.gstMpegtsT2DeliverySystemCellExtension = gstMpegtsT2DeliverySystemCellExtension;
		this.ownedRef = ownedRef;
	}

	~this ()
	{
		if ( Linker.isLoaded(LIBRARY_GSTMPEGTS[0]) && ownedRef )
			sliceFree(gstMpegtsT2DeliverySystemCellExtension);
	}


	/**
	 * id of the sub cell
	 */
	public @property ubyte cellIdExtension()
	{
		return gstMpegtsT2DeliverySystemCellExtension.cellIdExtension;
	}

	/** Ditto */
	public @property void cellIdExtension(ubyte value)
	{
		gstMpegtsT2DeliverySystemCellExtension.cellIdExtension = value;
	}

	/**
	 * centre frequency of the sub cell in Hz
	 */
	public @property uint transposerFrequency()
	{
		return gstMpegtsT2DeliverySystemCellExtension.transposerFrequency;
	}

	/** Ditto */
	public @property void transposerFrequency(uint value)
	{
		gstMpegtsT2DeliverySystemCellExtension.transposerFrequency = value;
	}

	/** */
	public static GType getType()
	{
		return gst_mpegts_t2_delivery_system_cell_extension_get_type();
	}
}
